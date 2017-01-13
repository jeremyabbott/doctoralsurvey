import {autoinject} from 'aurelia-framework';
import {EventAggregator} from 'aurelia-event-aggregator';
import {HttpClient} from 'aurelia-http-client';
import {Question} from './question';
import {Response} from './response';
import {Answer} from './answer';

@autoinject
export class Questions {
    heading = "Questions";
    questions : Array<Question> = [];
    private httpClient: HttpClient;
    private surveyId: string;
    private eventAggregator: EventAggregator;

    submitting: boolean = false;

    get isValid() : boolean {
        let result = this.questions
                        .map(q => {return q.isValid})
                        .reduce((p, c) => { return p && c}, true);
        return result;
    }

    get unansweredQuestions() : Array<Question> {
        return this.questions.filter(q => q.required && !q.answered);
    }

    constructor(private ea:EventAggregator) {
        this.httpClient = 
            new HttpClient()
                .configure(config => {
                    config.withBaseUrl('/');
            });
        this.eventAggregator = ea;
    }

    activate(params) {
        this.surveyId = params.surveyId;
        let url = 'questions/' + params.surveyId;
        return this.httpClient.get(url)
            .then(response => {
                let questions = response.content.map(q => {
                    return new Question(q.id, q.text, q.number, q.options, q.typeId, q.required, q.videoUrl);
                });
                this.questions = questions;
                this.eventAggregator.publish("startProgress", true);
            });
    }
    
    updateProgress() {
        let requiredQuestions = this.questions.filter(q => q.required);

        let percentComplete = requiredQuestions.filter(q => q.answered).length / requiredQuestions.length;
        this.eventAggregator.publish('progress', percentComplete);
    }

    getResponse() {
        let response = new Response(parseInt(this.surveyId));
        let answers = this.questions.filter(q => q.answered).map(q => {
            if(q.typeId === 1 || q.typeId === 4 || q.typeId === 5) { // text answer
                return [new Answer(0, q.answer, q.id)];
            }
            else if (q.typeId === 2) { // single option
                if(q.selectedOption != null) {
                    let option = q.selectedOption
                    return [new Answer(option.id, null, q.id)];
                }
            }
            else { // must be type 3 (multipe options)
                if(q.selectedOptions.length > 0) {
                    return q.selectedOptions.map(o => {return new Answer(o.id, null, q.id); });
                }
            }
        });
        // flatten the array of arrays of answers into an array of answers.
        // http://stackoverflow.com/questions/10865025/merge-flatten-an-array-of-arrays-in-javascript
        response.answers = [].concat.apply([], answers);;
        console.log(response);
        return response;
    }

    save(response: Response) {
        return this.httpClient.post('response', response)
            .then(result => {
                this.submitting = false;
                if(result.content.status.case === "Success"){
                    window.location.assign("#/complete/"); 
                }
            });
    }

    submit() {
        this.submitting = true;
        var response = this.getResponse();
        this.save(response);
    }
}