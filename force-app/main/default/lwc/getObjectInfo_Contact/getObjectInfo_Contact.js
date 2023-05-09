import { LightningElement, wire } from 'lwc';
//Import the adapter
import {getObjectInfo} from 'lightning/uiObjectInfoApi';
//Import Contact Object 
import CONTACT_OBJ from '@salesforce/schema/Contact';

export default class GetObjectInfo_Contact extends LightningElement {

    //return data, error
    /*
    {
        data : ....
        error : ...
    }*/

    recordTypeIdContact;

    @wire(getObjectInfo,{objectApiName: CONTACT_OBJ})
    contactHandler({data,error}){
        if(data){
            console.log(data);
            this.recordTypeIdContact = data.defaultRecordTypeId;
        }
        if(error){
            console.log(error);
        }
    }
}