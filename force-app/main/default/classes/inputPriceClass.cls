public with sharing class inputPriceClass {
    
    @AuraEnabled(cacheable=true)
    public static list<Ecommerce_Product__c> getProductCost(integer a) {
        return [SELECT Id, Name, Title__c, Price__c, Category__c, Brand__c FROM Ecommerce_Product__c WHERE Price__c <= : a WITH SECURITY_ENFORCED];
    }
}