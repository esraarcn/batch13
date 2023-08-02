import { LightningElement } from 'lwc';

export default class C2pProgressBarParent extends LightningElement {

    progressValue = 0;

    parentHandler(event){
        //event.detail contains the inputValue from the child component
        this.progressValue = event.detail;
    }

}