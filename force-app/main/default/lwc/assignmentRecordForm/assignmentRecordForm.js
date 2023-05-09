import { LightningElement } from 'lwc';
import LEAD_OBJ from '@salesforce/schema/Lead';

//Import Fields
import LASTNAME_FIELD from '@salesforce/schema/Lead.LastName';
import COMPANY_FIELD from '@salesforce/schema/Lead.Company';
import STATUS_FIELD from '@salesforce/schema/Lead.Status';

export default class AssignmentRecordForm extends LightningElement {
    objName=LEAD_OBJ;
    fields={
        lastName:LASTNAME_FIELD,
        company:COMPANY_FIELD,
        status:STATUS_FIELD
    };
    recordId='';
}