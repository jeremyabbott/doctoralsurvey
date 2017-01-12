export class Option {
    id: number;
    typeId: number;
    value: string

    constructor(id: number, typeId: number, value: string){
        this.id = id;
        this.typeId = typeId;
        this.value = value;
    }
}