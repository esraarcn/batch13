import { getFieldValue, getRecord, updateRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import CLOSE_DATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const FIELDS = [NAME_FIELD, TYPE_FIELD, STAGE_FIELD, AMOUNT_FIELD, CLOSE_DATE_FIELD];

export default class UpdateRecordOpp extends LightningElement {
    recordId = "0068d00000BzqZZAAZ";
    typeOptions = [];
    stageOptions = [];
    formdata = {};

    changeHandler(event) {
        this.formdata[event.target.name] = event.target.value;
    }

    updateHandler() {
        //populate record id
        this.formdata["Id"] = this.recordId;

        //prepare recordInput
        const recordInput = {fields: this.formdata};

        //update record
        updateRecord(recordInput)
            .then(result => {
                this.toastHandler("Success", "Opportunity has been saved successfully!", "success");
            })
            .catch(error => {
                console.error(error);
                this.toastHandler("Error", error.body.message, "error");
            })
    }

    toastHandler(title, message, variant) {
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);
    }

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    oppInfo;

    @wire(getPicklistValuesByRecordType, {
        objectApiName: OPP_OBJECT, 
        recordTypeId: '$oppInfo.data.defaultRecordTypeId'
    }) picklistHandler({data, error}) {
        if(data) {
            console.log(data);
            this.typeOptions = data.picklistFieldValues.Type.values;
            this.stageOptions = data.picklistFieldValues.StageName.values;
        }
    }

    @wire(getRecord, {
        recordId: '$recordId',
        fields: FIELDS
    }) opp;

    get name() {
        return getFieldValue(this.opp.data, NAME_FIELD);
    }

    get type() {
        return getFieldValue(this.opp.data, TYPE_FIELD);
    }

    get stage() {
        return getFieldValue(this.opp.data, STAGE_FIELD);
    }

    get amount() {
        return getFieldValue(this.opp.data, AMOUNT_FIELD);
    }

    get closedate() {
        return getFieldValue(this.opp.data, CLOSE_DATE_FIELD);
    }
}