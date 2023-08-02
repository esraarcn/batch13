import { LightningElement,wire } from 'lwc';
//import apex method
import searchContacts from '@salesforce/apex/ContactController_LWC.searchContacts';

export default class Wire_SearchContacts extends LightningElement {

    searchWord;
    contacts;
    error;

    searchHandler(event){
        this.searchWord = event.target.value;        
    }

    @wire(searchContacts,{searchString : '$searchWord'})
    contactValues({data,error}){
        if(data){
            this.contacts = data;
        }
        if(error){
            this.error = error;
        }
    }


    /*Property : contacts
    contacts = {
        data : [{
            con1
        },
        {
            con2
        }],
        error : .....            
        }
    }*/

    /*Function : contactValues({data,error}){
        if(data){
            this.contacts = data;
        }
    }*/



}