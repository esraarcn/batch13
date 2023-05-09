import { LightningElement, wire } from 'lwc';

//Import the adapter
import { getFieldValue,getFieldDisplayValue, getRecord } from 'lightning/uiRecordApi';

//For Layout Fields need not be imported
/*import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import PHONE_FIELD from '@salesforce/schema/Case.ContactPhone';*/


export default class GetRecord_Case extends LightningElement {

    recordId = '5008d00000IeYp6AAF';

    @wire(getRecord,{recordId :'$recordId', layoutTypes : ['Full'], mode : ['View'] })
    caseRecord;

    get priority(){
        console.log(this.caseRecord.data);
        return getFieldValue(this.caseRecord.data,'Case.Priority');
    }

    get phone(){
        return getFieldValue(this.caseRecord.data,'Case.ContactPhone');
    }

    get email(){
        return getFieldValue(this.caseRecord.data, 'Case.ContactEmail');
    }

    get accName(){
        return getFieldDisplayValue(this.caseRecord.data,'Case.Account');
    }
    

    
}