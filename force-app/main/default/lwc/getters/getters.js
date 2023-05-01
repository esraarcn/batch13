import { LightningElement } from 'lwc';

export default class Getters extends LightningElement {

//Arrays - similar to Apex List
students = ["ferzan", "gulnar", "mahri", "hatice"];

//getters

get firstStudent(){
    return this.students[0];
}

get lastStudent(){
    return this.students[3];
}



}