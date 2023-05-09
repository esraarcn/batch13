import { LightningElement,wire } from 'lwc';

//import the adapter
import {getRecord} from 'lightning/uiRecordApi';

//Import fields from Account Object
import ACCNAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';


export default class GetRecord_Account extends LightningElement {

    //RecordId or recordID, recordId 
    recordIdAcc = '0018d00000PkKUhAAN';
    accName;
    type;
    phone;
    industry;
    annRevenue;

    @wire(getRecord,{recordId:'$recordIdAcc', fields: [ACCNAME_FIELD,TYPE_FIELD,PHONE_FIELD,INDUSTRY_FIELD,ANNUALREVENUE_FIELD]})
    accountHandler({data,error}){
        if(data){
            console.log(data);
            this.accName = data.fields.Name.value;
            this.type = data.fields.Type.value;
            this.phone = data.fields.Phone.value;
            this.industry = data.fields.Industry.value;
            this.annRevenue =  data.fields.AnnualRevenue.displayValue;
        }
    }



}