import {Option} from 'option';

export class Question {
    answer: string;
    id: number;
    number: number;
    options : Array<Option>;
    text: string;
    selected: Option;
    typeId: number;

    get hasOptions() : boolean {
        return this.typeId === 2 || this.typeId === 3;
    }
    
    get isValid() : boolean {
        if (this.hasOptions) {
            return this.selected !== null;
        }
        else {
            return this.answer !== null && this.answer !== "";
        }
    }
        
    constructor(id: number, text: string, number: number, options: Array<Option>, typeId) {
        this.id = id;
        this.text = text;
        this.number = number;
        this.options = options;
        this.selected = null;
        this.typeId = typeId;
        this.answer = null;
    }
}