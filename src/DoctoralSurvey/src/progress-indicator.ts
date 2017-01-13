import {autoinject} from 'aurelia-framework';
import {EventAggregator} from 'aurelia-event-aggregator';
import {customElement, bindable} from 'aurelia-framework';

@customElement('progress-indicator')
export class ProgressIndicatorCustomElement  {
    started: boolean = false;;
    percentComplete: number = 0;
    eventAggregator: EventAggregator;

    constructor(ea: EventAggregator) {
        this.eventAggregator = ea;
        this.percentComplete = 0;
        this.eventAggregator.subscribe('progress', progress => {
            this.percentComplete = Math.ceil(progress * 100);
        });

        this.eventAggregator.subscribe('startProgress', started => {
            this.started = started;
        });
    }
}