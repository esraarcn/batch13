import CONTACT_OBJECT from '@salesforce/schema/Contact';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';


export default class AssignmentRecordTypeId_Contact extends LightningElement {

  europeRTId;

  @wire (getObjectInfo, {objectApiName:CONTACT_OBJECT})
  objectHandler({data,error}){
    if(data){
      
       console.log(data);
    const rtIds = data.recordTypeInfos;
    this.europeRTId = Object.keys(rtIds).find(rtId=>rtIds[rtId].name =='Europe');

    }
}
levelOpt;
@wire(getPicklistValuesByRecordType,{objectApiName:CONTACT_OBJECT,recordTypeId:'$europeRTId'})
  levelHandler({data,error}){
    if (data) {
      console.log(data);
      this.levelOpt=data.picklistFieldValues.Level__c.values;
    }

  }
  selectedLevel;
  handleChange(event){
    this.selectedLevel=event.detail.value;
  }

  sourceOpt;
@wire(getPicklistValuesByRecordType,{objectApiName:CONTACT_OBJECT,recordTypeId:'$europeRTId'})
sourceHandler({data,error}){
  if (data) {
    this.sourceOpt=data.picklistFieldValues.LeadSource.values;
  }

}
selectedSource;
handleChange1(event){
  this.selectedSource=event.detail.value;
}

}