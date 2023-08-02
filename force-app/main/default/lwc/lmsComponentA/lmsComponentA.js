import { LightningElement, wire } from 'lwc';
//import message channel
import DEMO_MC from '@salesforce/messageChannel/DemoMessageChannel__c';
import { publish, MessageContext } from 'lightning/messageService';

export default class LmsComponentA extends LightningElement {

messageCompA;

changeHandler(event){
    this.messageCompA = event.target.value;
}

@wire(MessageContext)
context;

publishHandler(){
    const message = {
        lmsDemoMessage : {
            value : this.messageCompA
        }
    };
    publish(this.context,DEMO_MC,message);
}

}