public with sharing class AccountController2_LWC {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getTenAccounts(){
        return [Select Id,Name,Type,Rating,AnnualRevenue from Account LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAllAccounts(){
        return [Select ID,Name from Account with SECURITY_ENFORCED ORDER BY Name];
    }

    @AuraEnabled
    public static Integer countContacts(Id accId){
        /*AggregateResult[] countCons = [SELECT COUNT(ID)countCon from Contact where AccountId =: accId WITH SECURITY_ENFORCED];
        Integer countContact;
        for (AggregateResult ar : countCons)  {
            countContact = Integer.valueOf(ar.get('countCon'));
        }
        return Integer.valueOf(countCons.get(0).get('countCon'));
        */
        List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId =: accId];
        Integer contactSize = contacts.size();
        return contactSize;
    }
}