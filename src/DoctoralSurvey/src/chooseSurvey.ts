import {autoinject} from 'aurelia-framework';
import {HttpClient, json} from 'aurelia-fetch-client';
import {Survey} from 'survey';

@autoinject
export class ChooseSurvey {
    surveys: Array<Survey> = [];

    constructor(private http: HttpClient) {
        http.configure(config => {
            config
                .useStandardConfiguration()
                .withBaseUrl('/');
        });
    }

    activate() {
        return this.http.fetch('surveys')
            .then(response => response.json())
            .then((surveysResponse) => {
                surveysResponse.entity.forEach(s => {
                    let survey = new Survey(s.id, s.name);
                    this.surveys.push(survey);
                });
            } );
    }
}