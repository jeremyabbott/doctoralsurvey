import {Survey} from './survey';

export class Introduction {
    coverLetter: string;
    videoUrl: string;
    showVideo: boolean = false;

    activate() {
        let selectedSurvey = JSON.parse(localStorage.getItem("selectedSurvey"));
        this.coverLetter = selectedSurvey.coverLetter;
        this.videoUrl = selectedSurvey.covertLetterVideoUrl;
        this.showVideo = this.videoUrl !== null && this.videoUrl !== "";
    }

    get bodySize() : string {
        return this.showVideo 
            ? "col-md-6" : "col-md-12";
    }
}