import {Option} from './option';

export interface IProduct {
   id: number;
   name: string;
}

export class Question {
    products: IProduct[] = [
        { id: 0, name: 'Motherboard' },
        { id: 1, name: 'CPU' },
        { id: 2, name: 'Memory' },
    ];

  selectedProducts: IProduct[] = [];

    answer: string; // for text question type
    id: number;
    number: number;
    options : Array<Option>;
    required: boolean = true;
    selectedOption: Option;
    selectedOptions: Option[] = [new Option(1, 2, "test")];
    text: string;
    typeId: number;

    get hasOptions() : boolean {
        return this.typeId === 2 || this.typeId === 3;
    }
    
    get isValid() : boolean {
        if (this.hasOptions) {
            if (this.typeId === 2) {
                return this.selectedOption !== null;
            }
            else if (this.typeId === 3) {
                return this.selectedOptions !== null && this.selectedOptions.length > 0;
            }
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
        this.selectedOption = null;
        this.selectedOptions = [];
        this.typeId = typeId;
        this.answer = null;
        this.required = required;
        this.options = options
    }

    test() {
        console.log(this.selectedOptions);
    }
}