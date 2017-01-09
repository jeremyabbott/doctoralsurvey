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
        //alert(params.surveyId);
        return this.httpClient.get('questions/3')
            .then(response => {
                response.content.forEach(q => {
                    let question = new Question(q.id, q.text, q.number, q.options, q.typeId, q.required);
                    this.questions.push(question);
                    console.log(this.questions);
                });
            });
    }

    getResponse() {
        var response = new Response(1);
        var answers = this.questions.map(q => {
            var optionId =  q.selected ? q.selected.id : 0;
            var answer = new Answer(optionId, q.answer, q.id);
            return answer;
        });
        response.answers = answers;
        return response;
    }

    save(response: Response) {
        return this.httpClient.post('response', response)
            .then(result => {
                console.log(result);
                if(result.content.status.case === "Success"){
                    window.location.assign("#/complete/"); 
                }
            })
        // return this.http.fetch('response', {
        //     method: "post",
        //     body: json(response)
        // })
        // .then(result => result.json())
        // .then(result => {
        //     console.log(result);
        //     if(result.status.case === "Success") {
        //         window.location.assign("#/complete/"); 
        //     }
        // });
    }

    submit() {
        var response = this.getResponse();
        this.save(response);
    }

}