import { LightningElement } from 'lwc';

export default class C2pProgressBarChild extends LightningElement {

    inputValue;

    changeHandler(event){
        this.inputValue = event.target.value;
        //create a custom event and dispatch it to the parent
        const progressEvent = new CustomEvent("passprogress",{
            detail : this.inputValue
        });
        this.dispatchEvent(progressEvent);
    }
}