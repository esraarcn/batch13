import { LightningElement, wire} from 'lwc';
//Import the adapters
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
//Import object
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
export default class getPicklistValuesByRecordType_Account_2 extends LightningElement {
individualRtId;
@wire(getObjectInfo,{objectApiName : ACCOUNT_OBJECT})
objectHandler({data,error}){
    if(data){
        console.log(data);
        //To find the respective record Type Id
        const rtIds = data.recordTypeInfos;
        this.individualRtId = Object.keys(rtIds).find(rtId=>rtIds[rtId].name=='Individual');
    }
}
ratingOptions;
accSourceOptions;
    @wire(getPicklistValuesByRecordType,{objectApiName : ACCOUNT_OBJECT,recordTypeId :'$individualRtId'})
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
            this.accSourceOptions = data.picklistFieldValues.AccountSource.values;
        }
    }
    selectedRating;
    handleChange(event){
        this.selectedRating = event.detail.value;
    }
    selectedAccountSource;
    handleChange_1(event){
        this.selectedAccountSource = event.detail.value;
    }
}