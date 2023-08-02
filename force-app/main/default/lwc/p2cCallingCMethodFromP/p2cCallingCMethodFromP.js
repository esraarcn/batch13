import { LightningElement } from 'lwc';

export default class P2cCallingCMethodFromP extends LightningElement {

    clickHandler(){
        //To call Child component method from Parent component
        this.template.querySelector('c-p2c-calling-c-method-from-p-child').resetSlider();
    }
}