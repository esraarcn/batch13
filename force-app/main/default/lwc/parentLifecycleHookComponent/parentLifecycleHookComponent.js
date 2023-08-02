import { LightningElement } from 'lwc';

export default class ParentLifecycleHookComponent extends LightningElement {

    showChild = false;
    
    constructor(){
        super();
        console.log('This is from Parent constructor');
    }

    connectedCallback(){
        console.log('This is from parent connectedCallback');
    }

    renderedCallback(){
        console.log('This is from parent renderedCallback');
    }

    clickHandler(){
        this.showChild = !this.showChild;
    }

    errorCallback(error,stack){
        console.log('This is from parent errorCallback');
        console.log(error.message);
        console.log(stack);
    }
}