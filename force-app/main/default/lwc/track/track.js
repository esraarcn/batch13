import { LightningElement, track } from 'lwc';

export default class Track extends LightningElement {


    //object
@track batch = {
    batchName : "Batch 13",
    batchSize : 70
}

@track module = ['LWC'];

batchNameHandler(event){
    console.log("Inside the method");
    this.batch.batchName = event.target.value;
}

get firstModule(){
    return this.module[0];
}


moduleHandler(event){
    this.module[0] = event.target.value;
}

}