import {autoinject} from 'aurelia-framework';
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
    get isValid() : boolean {
        let result = this.questions
                        .map(q => {return q.isValid})
                        .reduce((p, c) => { return p && c}, true);
        return result;
    }

    constructor() {
        this.httpClient = 
            new HttpClient()
                .configure(config => {
                    config.withBaseUrl('/');
            });
    }

    activate(params) {
        this.surveyId = params.surveyId;
        let url = 'questions/' + params.surveyId;
        return this.httpClient.get(url)
            .then(response => {
                response.content.forEach(q => {
                    let question = new Question(q.id, q.text, q.number, q.options, q.typeId, q.required, q.videoUrl);
                    this.questions.push(question);
                });
            });
    }

    getResponse() {
        let response = new Response(parseInt(this.surveyId));
        let answers = this.questions.map(q => {
            if(q.typeId === 1) { // text answer
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
                console.log(result);
                if(result.content.status.case === "Success"){
                    window.location.assign("#/complete/"); 
                }
            });
    }

    submit() {
        var response = this.getResponse();
        this.save(response);
    }
}