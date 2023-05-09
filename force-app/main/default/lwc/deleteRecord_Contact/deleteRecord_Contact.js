import { deleteRecord } from 'lightning/uiRecordApi';
import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class DeleteRecord_Contact extends LightningElement {

    recordId;
    changeHandler(event){
        this.recordId = event.target.value;
    }

    deleteRecordContact(){
        deleteRecord(this.recordId)
        .then(result=> {
            const event = new ShowToastEvent({
                title: 'Record Deleted',
                message:
                    'Contact Record deleted successfully',
                variant: 'success'
            });
            this.dispatchEvent(event);
        })
        .catch(error=>{
            const event = new ShowToastEvent({
                title: 'Ooops',
                message:
                    'Try again later!',
                variant: 'error'
            });
            this.dispatchEvent(event);
        })

    }

    resetHandler(){
        this.template.querySelector('form').reset();        
    }

}