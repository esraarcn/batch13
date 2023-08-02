import { LightningElement,wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';

//import the object
import OPP_OBJECT from '@salesforce/schema/Opportunity';
//import the field
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';

//import apex method
import getOppsByStageName from '@salesforce/apex/OpportunityController_LWC.getOppsByStageName';

//Add columns for datatable
const COLUMNS = [
    { label: 'Opportunity Name', fieldName: 'Name', type: 'text' },
    { label: 'Amount', fieldName: 'Amount', type:'currency' },
    { label: 'Stage Name', fieldName: 'StageName', type: 'text'}
];

export default class WireApex_OppsByStageName extends LightningElement {

    columns=COLUMNS;

    @wire(getObjectInfo, { objectApiName: OPP_OBJECT })
    oppInfo;

    stageOptions;
    @wire(getPicklistValues, {fieldApiName: STAGENAME_FIELD, recordTypeId: '$oppInfo.data.defaultRecordTypeId'})
    pickHandler({data,error}){
        if(data){
            this.stageOptions = data.values;
        }
    }

    selectedStage;
    changeHandler(event){
        this.selectedStage = event.target.value;
    }

    @wire(getOppsByStageName, {selectedStage : '$selectedStage'})
    opps;

    /**
     * opps = {
     *   data : {
     *          },
     *   error : ...
     * }
     */

}

/*
STEP 1 : Combobox with StageNames
getObjectInfo - get the Default recordTypeId
getPicklistValues - get the stageName picklist values
Prepare the combobox with the stagename options

STEP 2 :
Apex class - SOQL Select Name,Amount,StageName from Opportunity where StageName =: selectedStage

JS - 
1) import Apex method
2) Combobox, onchange - changeHandler - this.selectedStage = event.target.value
3) wire - apexMethod(parameter - pass $selectedStage), opps (property)

HTML
Datatable - Columns, Data
- Prepare Columns in JS
- Data (opps.data)
- key-field
*/