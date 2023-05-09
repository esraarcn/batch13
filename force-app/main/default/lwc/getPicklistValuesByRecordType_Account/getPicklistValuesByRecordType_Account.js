import { LightningElement, wire} from 'lwc';
//Import the adapters
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
//Import object
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetPicklistValuesByRecordType_Account extends LightningElement {
    
    //Get default record type Id using getObjectInfo
    @wire(getObjectInfo, {objectApiName:ACCOUNT_OBJECT})
    objectInfo;

    /*
    objectInfo = {
        data : {}
        error : 
    }    
    eg func
    if(data){
        this.defAccRtId = data.defaultRecordTypeId
    }
    */

    ratingOptions;
    @wire(getPicklistValuesByRecordType,{objectApiName : ACCOUNT_OBJECT,recordTypeId :'$objectInfo.data.defaultRecordTypeId'})
    ratingHandler({data,error}){
        if(data){
            console.log(data);
            /**
             data = {
                picklistFieldValues : {
                    Rating : {}
                    ..... 
                }
             }
             */
            this.ratingOptions = data.picklistFieldValues.Rating.values;

        }
    }

    selectedRating;
    handleChange(event){
        this.selectedRating = event.detail.value;
    }

}