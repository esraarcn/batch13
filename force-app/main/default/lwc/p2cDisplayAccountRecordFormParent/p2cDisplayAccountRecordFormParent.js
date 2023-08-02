import { LightningElement,wire } from 'lwc';
//import apex method 
import getTenAccounts from '@salesforce/apex/AccountController2_LWC.getTenAccounts';

export default class P2cDisplayAccountRecordFormParent extends LightningElement {

    accountOptions;
    accountId;
    showForm = false;

    @wire(getTenAccounts)
    accountHandler({data,error}){
        if(data){
            this.accountOptions = this.picklistGenerator(data);
            console.log(this.accountOptions);
        }        
    }


    /**
     * Array of Objects
     * label : Account Name
     * value : Account Id
     * 
     * For(Account acc: Accounts)
     */
    picklistGenerator(data){
        return data.map(item => ({
            label : item.Name,
            value : item.Id
        }))
    }

    handleChange(event){
        this.accountId = event.target.value;
    }

    clickHandler(){
        this.showForm = !this.showForm;
    }

}

/**
 * Parent Component - Combobox + button
Child Component - record-form

Step 1 : Create Combobox
1.1 Apex to retrieve all Accounts (10), Wire 
1.2 prepare the combobox options, (.map)
Label - Account Name
Value - Account Id 
1.3 onchange - store the value/ accountId 

Step 2 : Show Details - onclick, showForm Flag to display the child component

Step 3 : Child component, api recordId
3.1 Lightning record form, fields & object import

Step 4 : Compose the child component into the parent, and pass the account id to the child component 
 */