import searchStudentsByPostalCode2 from '@salesforce/apex/StudentController.searchStudentsByPostalCode1';
import { LightningElement } from 'lwc';

const COLUMNS = [
  { label: 'Student Name', fieldName: 'Student_Name__c',type: 'text'},
  { label: 'Mobile', fieldName: 'Mobile__c', type: 'phone' },
  { label: 'Email', fieldName: 'Email__c', type: 'email' },
  { label: 'Class', fieldName: 'Class__c', type: 'number' },
  { label: 'Postal Code', fieldName: 'Postal_Code__c', type: 'text' }
];

export default class ImperativeSearchStudentParent extends LightningElement {
    columns=COLUMNS;
    students;
    searchWord;
    error='Enter your postal code!!!'

    changeHandler(event){
        this.searchWord=event.target.value;
        searchStudentsByPostalCode2({searchPostal:this.searchWord})
        .then(result=>{
            this.students=result;
            if(this.students.length == 0){
                this.students=undefined;
                this.error='No students belongs to a postal code. try another please!'
            }else{
                this.error=undefined;
            }  
        })
        .catch(error=>{
            this.error=error;
            this.students=undefined;
        })
      }
}