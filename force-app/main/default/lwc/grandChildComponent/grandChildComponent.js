import { LightningElement } from 'lwc';

export default class GrandChildComponent extends LightningElement {

    handleClick(){
        const closeEvent = new CustomEvent('buttonclick',
        {detail: "You are AWESOME!!!!", bubbles : true, composed : true});
        this.dispatchEvent(closeEvent);
    }
}