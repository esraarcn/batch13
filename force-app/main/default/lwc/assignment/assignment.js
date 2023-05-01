import { LightningElement } from 'lwc';

export default class Assignment extends LightningElement {

firstName = 'Esra';
lastName = 'Arican';
age = 15;
cities=['Istanbul', 'London', 'Izmit','Aydin'];

specialities = {
    developer : 'perfect',
    architect : 'medium',
    admin : 'low' 

};

get fullName(){
    return this.firstName  +' '+this.lastName;
}

get firstCity(){
    return this.cities[0];
}

}