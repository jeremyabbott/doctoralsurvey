import {Option} from 'option';

export class Question {
    id: number;
    number: number;
    options : Array<Option>;
    text: string;
    selected: Option;

    get isValid() : boolean {
        return this.selected != null;           
    }
    
    constructor(id: number, text: string, number: number, options: Array<Option>) {
        this.id = id;
        this.text = text;
        this.number = number;
        this.options = options.reverse();
        this.selected = null;
    }
}