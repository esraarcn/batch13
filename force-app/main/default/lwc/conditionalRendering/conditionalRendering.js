import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement {
showContent = false;

handleClik(){
    this.showContent =true;
}
}