import { LightningElement } from 'lwc';

export default class C2pModalParent extends LightningElement {

showModal = false;
info;

clickHandler(){
    this.showModal = true;
}

closeHandlerParent(event){
    this.showModal = false;
    this.info = event.detail;
}

}