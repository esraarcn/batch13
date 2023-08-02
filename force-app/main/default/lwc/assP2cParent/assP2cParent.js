import { LightningElement } from 'lwc';

export default class AssP2cParent extends LightningElement {
    myName;

    changeHandler(event){
      this.myName=event.target.value;
    }
}