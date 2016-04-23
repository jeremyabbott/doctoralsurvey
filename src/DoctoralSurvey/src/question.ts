export class Question {
    id: number;
    options : Array<string>;
    text: string;
    
    constructor(id : number, text : string) {
        this.id = id;
        this.options = ["A", "B", "C", "D"];
        this.text = text;
    }
}