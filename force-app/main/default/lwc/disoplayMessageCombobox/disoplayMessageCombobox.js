import { LightningElement } from 'lwc';

export default class DisoplayMessageCombobox extends LightningElement {

showMessage = false;

get options() {
    return [
        { label: 'Display the message', value: 'Display' },
        { label: 'Hide the message', value: 'Hide' },
    ];
}

handleChange(event) {
    if(event.detail.value === 'Display'){
        this.showMessage = true;
    }
    if(event.detail.value === 'Hide'){
        this.showMessage = false;
    }
    
}
}