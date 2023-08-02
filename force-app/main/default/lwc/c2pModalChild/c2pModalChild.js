import { LightningElement } from 'lwc';

export default class C2pModalChild extends LightningElement {

    message = 'You can do it!!';

    closeHandlerChild(){
        const closeEvent = new CustomEvent('closemodal', {detail:this.message});
        this.dispatchEvent(closeEvent);
    }
}