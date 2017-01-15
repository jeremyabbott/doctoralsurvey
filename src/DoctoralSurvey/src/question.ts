import {Option} from './option';

export class Question {
    answer: string; // for text question type
    id: number;
    number: number;
    options : Array<Option>;
    required: boolean = true;
    selectedOption: Option;
    selectedOptions: Option[] = [new Option(1, 2, "test")];
    text: string;
    typeId: number;
    videoUrl: string = null;
    private showVideo: boolean = false;

    get hasOptions() : boolean {
        return this.typeId === 2 || this.typeId === 3;
    }
    
    get isValid() : boolean {
        if (this.typeId === 1) { // free text answer
            if (this.required) {
                return this.answer !== null && this.answer !== "";
            }
            return true;
        }
        else if (this.typeId === 2) { // single option answer
            if (this.required) {
                return this.selectedOption !== null;
            }
            return true;
        }
        else if (this.typeId === 3) { // multiple option answer
            if (this.required) {
                return this.selectedOptions !== null && this.selectedOptions.length > 0;
            }
            return true;
        }
        else if (this.typeId === 4) { // numeric
            let regex = /^[0-9]+$/;
            let inputIsValid = regex.test(this.answer);

            if (this.required) {
                return inputIsValid && this.answered;
            }
            return inputIsValid || !this.answered;
        }
        else if (this.typeId === 5) { // email
            let regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            let inputIsValid = regex.test(this.answer);

            if (this.required) {
                return inputIsValid && this.answered;
            }
            return inputIsValid || !this.answered;
        }
        return true;
    }

    get answered() : boolean {
        switch (this.typeId) {
            case 1:
            case 4:
            case 5:
                return this.answer !== null && this.answer !== "";
            case 2:
                return this.selectedOption !== null;
            case 3:
                return this.selectedOptions !== null && this.selectedOptions.length > 0;
        }
    }

    get classStatus() : string {
        if (!this.required && !this.answered) { // this only works for question type 2 right now.
            return "panel-warning";
        }
        else if (this.isValid) {
            return "panel-success";
        }
        return "panel-danger";
    }

    get panelBodySize() : string {
        return this.videoUrl !== null && this.videoUrl !== "" 
            ? "col-md-6" : "col-md-12";
    }

    get videoButtonText() : string {
        return this.showVideo ? "Hide Video" : "Show Video"
    }
        
    constructor(id: number, text: string, number: number, options: Array<Option>, typeId: number, required: boolean, videoUrl: string) {
        this.id = id;
        this.text = text;
        this.number = number;
        this.selectedOption = null;
        this.selectedOptions = [];
        this.typeId = typeId;
        this.answer = null;
        this.required = required;
        this.videoUrl = videoUrl

        if (options != null && options.length > 0) {
            for (var o = 0; o < options.length; o++) {
                options[o].value = String.fromCharCode(65 + o) + ". " + options[o].value;
            }
        }

        this.options = options;
    }

    toggleVideo() {
        this.showVideo = !this.showVideo;
    }
}