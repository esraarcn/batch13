import { createRecord } from 'lightning/uiRecordApi';
import { LightningElement } from 'lwc';
//import contact object
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateRecord_Contact extends LightningElement {

    inputData = {};

    changeHandler(event){
        //event.target.name & event.target.value
        /*inputData ={
            FirstName : "Madhu",
            LastName : "K",
            Email : "madhu@gmail.com"
        }*/
        const {name,value} = event.target;
        this.inputData[name] = value;

        //inputData["FirstName"] = "Madhu";
        //inputData["LastName"] = "K";
        //inputData["Email"] = "madhu@gmail.com"
    }

    createRecordContact(){
        //Contact con= new Contact();
        //con.FirstName
        const recordInput ={
            apiName : CONTACT_OBJECT.objectApiName,
            fields : this.inputData
        }

        //createRecord(recordInput : recordInputContact)
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
            }                
            )
        
    }


    resetForm(){
        this.template.querySelector('form.contactForm').reset();
        this.inputData = {};
    }

}