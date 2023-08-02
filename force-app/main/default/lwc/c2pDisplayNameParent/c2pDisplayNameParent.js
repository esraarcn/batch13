import { LightningElement } from 'lwc';

export default class C2pDisplayNameParent extends LightningElement {

    fName = "";
    lName = "";

    nameHandler(event){
        this.fName = event.detail.FirstName;
        this.lName = event.detail.LastName;        
    }


    get value(){
        if(this.fName !== "" && this.lName !== "") {
            return true;
        }
        
    }
}