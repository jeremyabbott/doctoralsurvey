export class Answer {
    optionId: number; // for multiple choice answers
    answer: string = null; // for free text answers
    questionId: number;

    constructor(optionId: number, answer: string, questionId: number){
        this.optionId = optionId;
        this.answer = answer;
        this.questionId = questionId
    }
}