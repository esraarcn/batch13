import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

//variables / properties

myName = 'Esra';
myAge = 15;
myAddress; //undefined
isLWCInteresting = true;
//Arrays - similar to Apex List
students = ["ferzan", "gulnar", "mahri", "hatice"];
//Object - {Key : Value} Similar to JSON
address = {
    city : "San Antonio",
    state : "Texas",
    zipcode : 78240
};

//Methods
//apex - public static string myMethod(integer a, string myName)


myMethod(){
    //let or var, const
    let displayMessage = 'method message';
    console.log("method variable " + displayMessage);
    //this.
    console.log("Class Variable"+this.myName);

}

}
