import { LightningElement,track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class DynamicAddDeleteRecords extends LightningElement {
    keyIndex = 0;
    @track itemList = [
        {
            id: 0
        }
    ];
    
    addRow() {
        ++this.keyIndex;
        var newItem = [{ id: this.keyIndex }];
        this.itemList = this.itemList.concat(newItem);
    }
    
    removeRow(event) {
        if (this.itemList.length >= 2) {
            this.itemList = this.itemList.filter(function (element) {
                return parseInt(element.id) !== parseInt(event.target.accessKey);
            });
        }
    }

    

    handleSuccess(event){
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Contacts successfully created',
                variant: 'success',
            }),
        );
        //handleReset();
    }

    handleError(event){
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error creating record',
                message: 'Please enter all the required fields',
                variant: 'error',
            }),
        );
    }

    handleSubmit(event) {
        var isVal = true;
        this.template.querySelectorAll('lightning-input-field').forEach(element => {
            isVal = isVal && element.reportValidity();
        });
        if (isVal) {
            this.template.querySelectorAll('lightning-record-edit-form').forEach(element => {
                element.submit();
            });
                
        }
        
    }

}