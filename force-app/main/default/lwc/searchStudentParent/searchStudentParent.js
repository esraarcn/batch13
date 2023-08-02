import searchStudentsByPostalCode from '@salesforce/apex/StudentController.searchStudentsByPostalCode';
import { LightningElement, wire } from 'lwc';

const COLUMNS = [
  { label: 'Student Name', fieldName: 'Student_Name__c',type: 'text'},
  { label: 'Mobile', fieldName: 'Mobile__c', type: 'phone' },
  { label: 'Email', fieldName: 'Email__c', type: 'email' },
  { label: 'Class', fieldName: 'Class__c', type: 'number' },
  { label: 'Postal Code', fieldName: 'Postal_Code__c', type: 'text' }
];

export default class SearchStudentParent extends LightningElement {
  columns=COLUMNS;
  students;
  searchWord;
  error;

  changeHandler(event){
    this.searchWord=event.target.value;
  }

  @wire (searchStudentsByPostalCode,{searchPostal:'$searchWord'})
  studentData({data,error}){
    if (data) {
      console.log('get DAta: ', data);
      this.students=data;
    }
    if (error) {
      this.error=error;
    }
  }

}