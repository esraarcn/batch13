import { LightningElement, wire} from 'lwc';
//import apex method
import getTenAccounts from '@salesforce/apex/AccountController_LWC.getTenAccounts';
const COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text', editable : true },
    { label: 'Type', fieldName: 'Type', type: 'text' },
    { label: 'Rating', fieldName: 'Rating', type: 'text' },
    { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency' }
];

export default class WireApex_Account extends LightningElement {

columns = COLUMNS;
accountValues;

//property or function
@wire(getTenAccounts)
accounts; 

@wire(getTenAccounts)
accountHandler({data,error}){
    if(data){
        this.accountValues = data;
    }
}

//As a FUNCTION 
//accountHandler - data,error
//As a PROPERTY
//accounts.data & accounts.error
//accounts = {
    //data : ....
    //error : ..... 
//}



}