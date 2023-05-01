import { LightningElement } from 'lwc';

export default class AssignmentCalculator extends LightningElement {
    a;
    b;

    aHandler(event){
        this.a=event.target.value;
    }

    bHandler(event){
        this.b=event.target.value;
    }

    get total(){
        return Number(this.a) + Number(this.b);    
    }
}