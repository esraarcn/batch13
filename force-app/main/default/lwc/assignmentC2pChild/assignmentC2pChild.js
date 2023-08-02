import { LightningElement } from 'lwc';

export default class AssignmentC2pChild extends LightningElement {

  clickHandler(){
    const customerEvent=new CustomEvent('showcustomer',{detail:{
      Name:'Zeynep', 
      Email: 'z@gmail.com',
      Phone: '5869860',
      Address: 'Turkey'
    }});
    this.dispatchEvent(customerEvent);
  }
}