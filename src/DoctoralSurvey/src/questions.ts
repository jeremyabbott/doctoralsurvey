import {autoinject} from 'aurelia-framework';
import {HttpClient, json} from 'aurelia-fetch-client';
import {Question} from 'question';
import {Response} from 'response';
import {Answer} from 'answer';

@autoinject
export class Questions {
    heading = "Questions";
    questions : Array<Question>;

    get isValid() : boolean {
        let result = this.questions
                        .map(q => {return q.isValid})
                        .reduce((p, c) => { return p && c});
        return result;
    }

    constructor(private http: HttpClient) {
        http.configure(config => {
            config
                .useStandardConfiguration()
                .withBaseUrl('/');
        });
    }

    activate() {
        return this.http.fetch('questions')
            .then(response => response.json())
            .then(questions => {
                this.questions = [];
                questions.forEach(q => {
                    let question = new Question(q.id, q.text, q.number, q.options);
                    this.questions.push(question);
                });
            });
    }

    getResponse() {
        var response = new Response(1);
        var answers = this.questions.map(q => {
            var optionId =  q.selected ? q.selected.id : 0;
            var answer = new Answer(optionId, "", q.id);
            return answer;
        });
        response.answers = answers;
        return response;
    }

    save(response: Response) {
        return this.http.fetch('response', {
            method: "post",
            body: json(response)
        })
        .then(result => result.json())
        .then(result => {
            if(result.status.case === "Success") {
                alert(result.status.case);    
            }
        });
    }

    submit() {
        var response = this.getResponse();
        this.save(response);
    }

}