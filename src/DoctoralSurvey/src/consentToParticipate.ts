import {Survey} from './survey';

export class ConsentToParticipate {
    consentLetter: string;
    videoUrl: string;
    showVideo: boolean = false;
    surveyId: number;

    activate() {
        let selectedSurvey : Survey = JSON.parse(localStorage.getItem("selectedSurvey"));
        this.consentLetter = selectedSurvey.consentLetter;
        this.videoUrl = selectedSurvey.consentVideoUrl;
        this.showVideo = this.videoUrl !== null && this.videoUrl !== "";
        this.surveyId = selectedSurvey.id;
    }

    get bodySize() : string {
        return this.showVideo 
            ? "col-md-6" : "col-md-12";
    }
}