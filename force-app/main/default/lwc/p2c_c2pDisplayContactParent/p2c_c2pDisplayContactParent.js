import { LightningElement } from 'lwc';

export default class P2c_c2pDisplayContactParent extends LightningElement {
    recordId;
    showModal = false;
    message;

    recordIdHandler(event){
        this.recordId = event.target.value;
    }

    showDetailsHandler(){
        this.showModal =  !this.showModal;
    }

    closeHandlerParent(event){
        this.message = event.detail;
        
    }
}