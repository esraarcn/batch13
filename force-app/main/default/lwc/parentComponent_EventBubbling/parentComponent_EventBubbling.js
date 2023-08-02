import { LightningElement } from 'lwc';

export default class ParentComponent_EventBubbling extends LightningElement {

    info;

    parentClickHandler(event){
        this.info = event.detail;
    }
}