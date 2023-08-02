import { LightningElement } from 'lwc';

export default class ChildLifecycleHookComponent extends LightningElement {

    constructor(){
        super();
        console.log('This is from child constructor');
    }

    connectedCallback(){
        console.log('This is from child connectedCallback');
        throw new Error("This is error from Child");
    }

    renderedCallback(){
        console.log('This is from child renderedCallback');
    }

    disconnectedCallback(){
        console.log('This is from child disconnectedCallback');
    }
}