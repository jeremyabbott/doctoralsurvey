export class Question {
    id: number;
    number: number;
    options : Array<string>;
    text: string;
    selected: number;
    
    constructor(id: number, text: string, number: number) {
        this.id = id;
        this.text = text;
        this.number = number;
    }
}