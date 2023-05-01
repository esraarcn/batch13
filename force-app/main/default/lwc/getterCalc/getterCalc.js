import { LightningElement } from 'lwc';

export default class GetterCalc extends LightningElement {

a = 10;
b = 5;
get sum(){
    return this.a + this.b;
}

get subt(){
    return this.a - this.b;
}

get mult(){
    return this.a * this.b;
}

get div(){
    return this.a / this.b;
}







}