@isTest
public with sharing class StudentControllerTest {
   
    
    @TestSetup
    static void makeData(){
        list<Student__c> listStudent=new list<Student__c>();

        for (Integer i = 0; i < 100; i++) {
            Student__c newStudent=new Student__c();
            newStudent.Student_Name__c='Name'+i;
            newStudent.Mobile__c='1223445'+i;
            newStudent.Email__c='s@s.com';
            newStudent.Postal_Code__c='100'+i;
            listStudent.add(newStudent);
        }
        insert listStudent;
    }

    @istest 
    private static void testSearch() {
        
        
        list<Student__c> liststudent= StudentController.searchStudentsByPostalCode('100');
        
        assert.areEqual(100, liststudent.size());
    }
}