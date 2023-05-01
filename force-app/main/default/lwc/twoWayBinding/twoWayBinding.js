import { LightningElement } from 'lwc';

export default class TwoWayBinding extends LightningElement {

studentName = "Esra";
age;
changeHandler(){
    this.studentName = event.target.value; 
}

ageHandler(){
    this.age = event.target.value;
}

//object
batch = {
    batchName : "Batch 13",
    batchSize : 70
}

batchNameHandler(event){
    this.batch.batchName = event.target.value;
}



}