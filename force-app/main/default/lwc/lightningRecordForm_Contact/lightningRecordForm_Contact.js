import { LightningElement } from 'lwc';

//Import Object
import CONTACT_OBJECT from '@salesforce/schema/Contact';
//Import Fields
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import RecordId from '@salesforce/schema/CollaborationGroupRecord.RecordId';

export default class LightningRecordForm_Contact extends LightningElement {

    objectApiName = CONTACT_OBJECT;
    recordId = '0038d00000OS3oYAAT';
    fields = [LASTNAME_FIELD];


}