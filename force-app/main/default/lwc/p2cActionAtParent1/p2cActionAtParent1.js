import { LightningElement } from 'lwc';
//import apex method
import getTenAccounts from '@salesforce/apex/AccountController2_LWC.getTenAccounts';

export default class P2cActionAtParent1 extends LightningElement {

    accounts;
    error;

    clickHandler(){
        getTenAccounts()
        .then(result => {
            this.accounts = result;
        })
        .catch(error =>{
            this.error = error;
        })        
    }
}


/*Step 1 : Create a button in Parent Component

Step 2 : onclick of the button - call the handler in JS - call the apex imperatively
2.1 Store the results of getAccounts in a property accounts 

Step 3 : Parent HTML, call the child component and pass the accounts
3.1 In Child Component JS, have a property @api accountsInfo

Step 4 : Child HTML, for:each and display the data */