public with sharing class OpportunityController_LWC {
    
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppsByStageName(string selectedStage){
        return [Select Name,Amount,StageName from Opportunity where StageName =:selectedStage LIMIT 10];       
    }
}