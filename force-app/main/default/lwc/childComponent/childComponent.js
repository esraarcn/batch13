import { LightningElement } from 'lwc';

export default class ChildComponent extends LightningElement {
    infoChild;
    
    childClickHandler(event){
        this.infoChild = event.detail;
    }
}