import { LightningElement } from 'lwc';

export default class C2pDisplayNameChild extends LightningElement {

    clickHandlerChild(){
        const nameEvent = new CustomEvent('nameclick',
        {detail : {
            FirstName : "Tom",
            LastName : "Jerry"
        }});
        this.dispatchEvent(nameEvent);
    }

    /**
     * Account acc = {
     *    Name : "TestAccount",
     *    Amount : 124555,
     *    .... 
     * }
     */
}