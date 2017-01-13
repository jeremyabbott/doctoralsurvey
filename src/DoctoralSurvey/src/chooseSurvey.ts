import {HttpClient} from 'aurelia-http-client';
import {Survey} from './survey';

export class ChooseSurvey {
    surveys: Array<Survey> = [];
    hasLocalStorage: boolean = true;
    
    activate() {
        this.surveys = [];
        
        if (typeof window.location !== 'undefined') {
            this.getSurveys();
        }
    }

    chooseSurveyClick(survey: Survey) {
        window.location.assign("#/introduction");
        localStorage.setItem("selectedSurvey", JSON.stringify(survey));
    }

    private getSurveys() {
        let httpClient = 
            new HttpClient()
                .configure(config => {
                    config.withBaseUrl('/');
            });

         httpClient.get('surveys')
            .then((responseMessage) => {
                responseMessage.content.entity.forEach(s => {
                    let survey =
                        new Survey( s.id, 
                                    s.name,
                                    s.consentLetter,
                                    s.consentVideoUrl,
                                    s.coverLetter,
                                    s.coverLetterVideoUrl);
                    this.surveys.push(survey);
                });
            } );
    }
}