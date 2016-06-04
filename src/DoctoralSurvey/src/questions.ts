import {autoinject} from 'aurelia-framework';
import {HttpClient} from 'aurelia-fetch-client';
import {Question} from 'question';
import 'fetch';

@autoinject
export class Questions {
    heading = "Questions";
    questions : Array<Question>;

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
                   let question = new Question(q.id, q.text);
                   let options = q.options.map(o => {
                       return o.value;
                   });
                   question.options = options
                   this.questions.push(question);
                });
            });
    }
}