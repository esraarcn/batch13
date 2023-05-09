import { LightningElement , wire } from 'lwc';
import OPP_OBJ from '@salesforce/schema/Opportunity';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import OPPNAME_FIELD from '@salesforce/schema/Opportunity.Name';
export default class Assignment_OppInformation extends LightningElement {
    dftOppId;
    typeOption;
    stageOpt;
    OppName1 = OPPNAME_FIELD;
    @wire (getObjectInfo, {objectApiName:OPP_OBJ})
  objectHandler({data,error}){
    if(data){
    console.log(data);
    this.dftOppId = data.defaultRecordTypeId;

    }
}
   @wire(getPicklistValues,{fieldApiName:TYPE_FIELD,recordTypeId:'$dftOppId'})
  typeHandler({data,error}){
    if (data) {
      console.log(data);
      this.typeOption = data.values;
    }
  }
   @wire(getPicklistValues,{fieldApiName:STAGENAME_FIELD,recordTypeId:'$dftOppId'})
stageHandler({data,error}){
  if (data) {
    console.log(data);
    this.stageOpt=data.values;
  }
}

oppType;
typeHandler2(event){
    this.oppType=event.detail.value;
}
oppName;
nameHandler(event){
    this.oppName=event.target.value;
}
oppStage;
stageHandler2(event){
    this.oppStage=event.detail.value;
}
}