import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { createRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class CreateRecord_Account extends LightningElement {
    inputdata={};
    changeHandler(event){
        const {name,value}=event.target;
        this.inputdata[name]= value;
    }
    createRecordAccount(){
        const recordInput= {
            apiName: ACCOUNT_OBJECT.objectApiName,
            fields:this.inputdata
        }
        createRecord(recordInput)
            .then(result=>{
                const event = new ShowToastEvent({
                    title: 'Record Created',
                    message:
                        'Contact Created successfully',
                    variant: 'success'
                });
                this.dispatchEvent(event);
                this.resetForm();
            }
            )
            .catch(error=>{
                const event = new ShowToastEvent({
                    title: 'Record Error',
                    message:
                        'Oops! Better luck next time!',
                    variant: 'error'
                });
                this.dispatchEvent(event);
                this.resetForm();
            }
            )
    }
    resetForm(){
        this.template.querySelector(form).reset();
        this.inputData = {};
    }
}  


