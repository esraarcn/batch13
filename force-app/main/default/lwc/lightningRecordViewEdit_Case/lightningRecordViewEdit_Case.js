import { LightningElement } from 'lwc';

//Import Object
import CASE_OBJ from '@salesforce/schema/Case';

//Import Fields
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import CASEORIGIN_FIELD from '@salesforce/schema/Case.Origin';

export default class LightningRecordViewEdit_Case extends LightningElement {

objName = CASE_OBJ;
fields ={
    Subject : SUBJECT_FIELD,
    Status : STATUS_FIELD,
    CaseOrigin : CASEORIGIN_FIELD
};
//Case Object Record Id
recordId = '5008d00000IeYokAAF';

}