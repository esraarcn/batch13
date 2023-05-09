import LEADSOURCE_FIELD from '@salesforce/schema/Contact.LeadSource';
import OPPORTUNITY_OBJ from '@salesforce/schema/Opportunity';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
export default class AssignmentPicklist_Opp extends LightningElement {
   sourceOptions;
   stageOptions;
   oppId;

    @wire(getObjectInfo,{objectApiName:OPPORTUNITY_OBJ})
    oppHandler({data,error}){
        if (data) {
            console.log(data);
            this.oppId= data.defaultRecordTypeId;
            
        }
        if(error){
            console.log(error);

        }
    }
    

    @wire(getPicklistValues, {recordTypeId:'$oppId', fieldApiName: LEADSOURCE_FIELD})
    leadSourceHandler({data,error}){
        if (data) {
            console.log(data);
            this.sourceOptions=data.values;
        }
        if(error){
            console.log(error);
        }
    }
    @wire(getPicklistValues, { recordTypeId:'$oppId', fieldApiName: STAGENAME_FIELD})
    stageNameceHandler({data,error}){
        if (data) {
            console.log(data);
            this.stageOptions=data.values;
        }
        if(error){
            console.log(error);
        }
    }
}

