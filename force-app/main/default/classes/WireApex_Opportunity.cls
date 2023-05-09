public with sharing class WireApex_Opportunity {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> listOpp () {
        return [select Id, Name, ExpectedRevenue, Amount, CloseDate, StageName from Opportunity where StageName='Closed Won' limit 10];
    }
}