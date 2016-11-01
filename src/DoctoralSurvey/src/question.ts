import {Option} from 'option';

export class Question {
    answer: string;
    id: number;
    number: number;
    options : Array<Option>;
    required: boolean = true;
    selected: Option;
    text: string;
    typeId: number;

    get hasOptions() : boolean {
        return this.typeId === 2 || this.typeId === 3;
    }
    
    get isValid() : boolean {
        if (this.hasOptions) {
            return this.selected !== null;
        }
        else if (this.required) {
            return this.answer !== null && this.answer !== "";
        }
        else {
            return true;
        }
    }

    get answered() : boolean {
        return this.answer !== null && this.answer !== "";
    }

    get classStatus() : string {
        if (this.isValid) {
            return "panel-success";
        }
        else if (!this.required && !this.answered) {
            return "panel-warning";
        }
        else {
            return "panel-danger";
        }
    }
        
    constructor(id: number, text: string, number: number, options: Array<Option>, typeId: number, required: boolean) {
        this.id = id;
        this.text = text;
        this.number = number;
        this.options = options;
        this.selected = null;
        this.typeId = typeId;
        this.answer = null;
        this.required = required;
    }
}