import { LightningElement } from 'lwc';
//import apex method
import getContacts from '@salesforce/apex/ContactController_LWC.getContacts';
const COLUMNS = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName' },
    { label: 'Email', fieldName: 'Email', type: 'email' }
];

export default class P2cActionAtParent2 extends LightningElement {

columns = COLUMNS;
contacts;
error;

    clickHandler(){
        getContacts()
        .then(result =>{
            this.contacts = result;
        })
        .catch(error =>{
            this.error=error;
        })
    }

}

/*Step 1 : Create a button in Parent Component

Step 2 : onclick of the button - call the handler in JS - call the apex imperatively
2.1 Store the results of getContacts in a property contacts
2.2 Create a property named columns and pass the const COLUMNS 

Step 3 : Parent HTML, call the child component and pass the contacts(data), columns
3.1 In Child Component JS, have a property @api contactsInfo, @api columnsChild

Step 4 : Child HTML, Datatable - columns,data */