import { LightningElement } from 'lwc';

import calculateImperative from '@salesforce/apex/Calculator_LWC.calculateImperative';

export default class ImperativeApex_Calculator extends LightningElement {
    a;

    firstHandler(event){
        this.a = event.target.value;
    }

    b;
    secondHandler(event){
        this.b = event.target.value;
    }

    imperativeResult;

calcHandler(event){

    var operation = event.target.name;
    calculateImperative({a:this.a , b:this.b , operation:operation})
    .then(result => {

        this.imperativeResult = result;

    })

    .catch(error =>{
        this.error = error;
    })
}
}