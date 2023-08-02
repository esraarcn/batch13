public with sharing class StudentController {
   
    @AuraEnabled(cacheable=true)
    public static list<Student__c> searchStudentsByPostalCode(string searchPostal) {

        searchPostal='%'+searchPostal+'%';

        return [select id, Student_Name__c, Mobile__c, Email__c, Class__c, Postal_Code__c from Student__c where Postal_Code__c like: searchPostal];
        
    }
    @AuraEnabled
    public static list<Student__c> searchStudentsByPostalCode1(string searchPostal) {

        searchPostal='%'+searchPostal+'%';

        return [select id, Student_Name__c, Mobile__c, Email__c, Class__c, Postal_Code__c from Student__c where Postal_Code__c like: searchPostal];
        
    }
    
}