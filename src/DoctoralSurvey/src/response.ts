import {Answer} from './answer';

export class Response {
    answers: Array<Answer>;
    surveyId: number;

    constructor(surveyId: number){
        this.surveyId = surveyId;
    }
}