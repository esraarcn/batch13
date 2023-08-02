import { LightningElement } from 'lwc';

export default class AssignmentC2pParent extends LightningElement {

  showDetail=false;
  cName;
  cEmail;
  cPhone;
  cAddress;
  
  detailHandler(event){
    this.showDetail=true;
    this.cName=event.detail.Name;
    this.cEmail=event.detail.Email;
    this.cPhone=event.detail.Phone;
    this.cAddress=event.detail.Address;
  }
 


}