export class Survey {
    id: number;
    name: string;
    consentLetter: string;
    consentVideoUrl: string
    coverLetter: string;
    covertLetterVideoUrl: string;
    
    constructor(id: number, name: string,
                consentLetter: string, consentVideoUrl: string,
                coverLetter: string, coverLetterVideoUrl: string) {
        this.id = id;
        this.name = name;
        this.coverLetter = coverLetter;
        this.covertLetterVideoUrl = coverLetterVideoUrl;
        this.consentLetter = consentLetter;
        this.consentVideoUrl = consentVideoUrl;
    }
}