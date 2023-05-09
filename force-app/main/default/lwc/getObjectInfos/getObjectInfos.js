import { LightningElement, wire } from 'lwc';
//Import the adapter
import {getObjectInfos} from 'lightning/uiObjectInfoApi';
//Import Contact Object 
import LEAD_OBJ from '@salesforce/schema/Lead';
import OPP_OBJ from '@salesforce/schema/Opportunity';

export default class GetObjectInfos extends LightningElement {
    leadRTId;
    oppRTId;

    @wire(getObjectInfos,{objectApiNames: [LEAD_OBJ, OPP_OBJ]})
    objHandler({data,error}){
        if(data){
            console.log(data);
            this.leadRTId = data.results[0].result.defaultRecordTypeId;
            this.oppRTId = data.results[1].result.defaultRecordTypeId;
        }
        if(error){
            console.log(error);
        }
    }
}