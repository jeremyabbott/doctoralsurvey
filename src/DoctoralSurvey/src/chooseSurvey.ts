import {HttpClient} from 'aurelia-http-client';
import {Survey} from './survey';

export class ChooseSurvey {
    surveys: Array<Survey> = [];
    
    public activate() {
        console.log("activate");
        let httpClient = 
            new HttpClient()
                .configure(config => {
                    config.withBaseUrl('/');
            });
        httpClient.get('surveys')
            .then((responseMessage) => {
                console.log(responseMessage);

                responseMessage.content.entity.forEach(s => {
                    let survey = new Survey(s.id, s.name);
                    this.surveys.push(survey);
                });
            } );
    }
}