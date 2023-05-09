import { LightningElement, wire } from 'lwc';

//Import the adapter
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from "lightning/uiObjectInfoApi";
//Import Field
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';


//import the object
import CASE_OBJ from "@salesforce/schema/Case";

export default class GetPicklistValues_Case extends LightningElement {

    statusOptions;
    defCaseRTId;
    priorityOptions;

    @wire(getObjectInfo, {objectApiName : CASE_OBJ})
    caseHandler({data,error}){
        if (data) {
            this.defCaseRTId = data.defaultRecordTypeId;
        }
    }

    @wire(getPicklistValues,{fieldApiName : STATUS_FIELD, recordTypeId : '$defCaseRTId'})
    caseStatusHandler({data,error}){
        if(data){
            console.log(data);
            this.statusOptions = data.values;
            //New : Fresh
            //In Progress : Doing
            //Closed : Done
        }
        if(error){
            console.log(error);
        }
    }
    @wire(getPicklistValues,{fieldApiName : PRIORITY_FIELD, recordTypeId : '$defCaseRTId'})
    casePriorityHandler({data,error}){
        if (data) {
            this.priorityOptions = data.values;
        }
    }
}