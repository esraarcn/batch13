public class AccountsBatch implements Database.Batchable<SObject> , Database.stateful{
    integer recordCount =0;
    //start method -> SOQL QUERY -> ACCOUNT -> 50k
    public Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('inside start method.');
        Database.QueryLocator acc = database.getQueryLocator([select id, name, active__c, Description from account]);
        return acc;
    }

    public void execute(Database.BatchableContext bc, list<account> scope){
        system.debug('inside execute method');
        System.debug('check recordCount FİRST' + recordCount);
        //update account records
        List<account>updateAccount = new List<account>();
        for (account eachAcc : scope) {
            if(eachAcc.active__c != 'no'){
                eachAcc.Description += '...Updated via batch';
                updateAccount.add(eachAcc);
                recordCount++;
            }
            
        }
        if(!updateAccount.isempty()){
        update scope;
        recordCount +=updateAccount.size();
        System.debug('check recordCount SECOND: ' + recordCount);
    }
    }
    //finish method
    public void finish(Database.BatchableContext bc){
        system.debug('finished with all records.');
        System.debug('check recordCount FİNAL: ' + recordCount);
    }
}