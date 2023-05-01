import { LightningElement } from 'lwc';

export default class ConditionalRenderingToggle extends LightningElement {

    showContent = false;

    toggleHandler(){
        this.showContent = !this.showContent;
    }

}