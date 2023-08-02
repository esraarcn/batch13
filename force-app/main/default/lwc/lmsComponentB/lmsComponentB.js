import { LightningElement,wire } from 'lwc';
import { subscribe, MessageContext, APPLICATION_SCOPE } from 'lightning/messageService';
import DEMO_MC from '@salesforce/messageChannel/DemoMessageChannel__c';

export default class LmsComponentB extends LightningElement {

    messageCompB;

    @wire(MessageContext)
    context;

    connectedCallback(){
        subscribe(
            this.context,
            DEMO_MC,
            (message) => {this.listenerHandler(message)},
            {scope:APPLICATION_SCOPE}
        )
    }

    listenerHandler(message){
        this.messageCompB = message.lmsDemoMessage.value;
    }

    


}