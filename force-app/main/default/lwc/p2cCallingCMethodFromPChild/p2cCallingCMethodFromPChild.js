import { LightningElement,api } from 'lwc';

export default class P2cCallingCMethodFromPChild extends LightningElement {
    val = 50;

    @api
    resetSlider(){
        this.val = 30;
    }
}