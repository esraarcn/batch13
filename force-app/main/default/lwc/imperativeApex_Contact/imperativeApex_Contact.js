import { LightningElement } from 'lwc';
//import apex method
import getContacts from '@salesforce/apex/ContactController_LWC.getContacts';
const COLUMNS = [
    { label: 'First Name', fieldName: 'FirstName', type: 'text', editable : true },
    { label: 'Last Name', fieldName: 'LastName', type: 'text' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    
];
export default class ImperativeApex_Contact extends LightningElement {
    columns = COLUMNS;
    contacts;
    error;

    contactHandler(){

        getContacts()
        .then(result =>{
            console.log(result);
            this.contacts = result;
        })
        .catch(error => {
            this.error = error;
        })
    }
}