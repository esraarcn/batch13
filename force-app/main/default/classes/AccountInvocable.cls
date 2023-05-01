public with sharing class AccountInvocable {

    @invocableMethod(label = 'Close Related Opportunities'
                     category = 'Account')
    public static void closeOpportunities(List<Id> accountIds){
        // get all the open related opportunities

        List<Opportunity> opps = [SELECT id, StageName
                                  FROM Opportunity
                                  WHERE AccountId IN: accountIds 
                                  AND StageName NOT IN ('Closed Won', 'Closed Lost')
                                 ];

        if(!opps.isEmpty()){
            for(Opportunity opp : opps){
                opp.StageName = 'Closed Lost';
            }
            update opps;
        }
    }
}