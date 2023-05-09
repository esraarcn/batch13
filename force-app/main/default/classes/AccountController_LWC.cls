public with sharing class AccountController_LWC {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getTenAccounts(){
        return [Select Id,Name,Type,Rating,AnnualRevenue from Account LIMIT 10];
    }
}