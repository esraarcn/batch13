
trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    //if account triggeris disabled, then return
    TriggerSwitch__c ts = TriggerSwitch__c.getInstance('account');
    if(!ts.enabled__c){
        return;
    }

   // system.debug('--- trigger start ----');
    if (Trigger.isBefore) {
        AccountTriggerHandler.updateDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        


        //call VIP update 
        AccountTriggerHandler.updateVIPForAllContact(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    
    
    
   /* if (Trigger.isBefore) {
        for (account eachAcc : trigger.new) {
           if (trigger.isInsert&& eachAcc.active__c == 'yes') {
            //update description field
            eachAcc.Description = 'account is active now!';
           } 

           if (Trigger.isUpdate) {
            //check if active field is cahanged from 'no' or '--none--'to 'yes'
            //how to check if field is changed?
            //oldAccount active field != newAccount active field.
            //how to get oldAccount and newAccount active field

            //new Account active field as below
            string newActive =eachAcc.Active__c;
            //old Account active field 
            //we use oldMap.get(key)
            account oldAccount =trigger.oldMap.get(eachAcc.Id);
            string oldActive = oldAccount.Active__c;

            //check if active field is changed from 'no' or '--none--' to 'yes'
            if (newActive != oldActive && newActive == 'yes') {
                eachAcc.Description = 'account is active now.';
            }
           }
        }


    }



/*    system.debug('--- trigger start ----');
 Map<id, account> trgNewMap = trigger.newMap;//key = ID, value = record.
    Map<id, account> trgOldMap = trigger.oldMap;


    if (Trigger.isBefore && Trigger.isUpdate) {
        //set<id> accIds = trgNewMap.keySet();
        for (Id eachId : trgNewMap.keySet()) {
            account newAcc = trgNewMap.get(eachId);
            account oldAcc = trgOldMap.get(eachId);

            string newWebsite = newAcc.Website;
            system.debug('newWebsite is ===> ' + newWebsite);
            string oldWebsite = oldAcc.Website;
            system.debug('oldWebsite is ===> ' + oldWebsite);
            if (newWebsite != oldWebsite) {
                system.debug('For account ' + newAcc.Name + ', new WEBSITE is ' + newWebsite);
            }
        }
        }





    /*
    Map<id, account> trgNewMap = trigger.newMap;
    Map<id, account> trgOldMap = trigger.oldMap;

    if (trigger.isAfter && trigger.isUpdate) {
       System.debug('--afterupdate--');
       set<id> accIds = trgNewMap.keySet();
       set<id> accIdsOld = trgOldMap.keySet();

        for (Id eachId : accIds) {
            System.debug('--for each start');
            System.debug('each Id is ' + eachID);
            account newAcc = trgNewMap.get(eachId);
            account oldAcc = trgOldMap.get(eachId);

            System.debug('new acc name is ' + newAcc.Name + ' , its old name was ' + oldAcc.Name);
            System.debug('--for each end--');
        }





    }






    /*
    if (Trigger.isBefore && Trigger.isInsert ) {
        system.debug('==BEFORE INSERT==');
        system.debug('trigger.newMap -> ' + trgNewMap); //null -> ID is null, so Map<id, account> is ALSO NULL.
        system.debug('trigger.oldMap -> ' + trgoldMap); //null --> OLD is NULL.
    }
    if (Trigger.isAfter && Trigger.isInsert ) {
        system.debug('==AFTER INSERT==');
        system.debug('trigger.newMap -> ' + trgNewMap);//yes (not null)
        system.debug('trigger.oldMap -> ' + trgoldMap);//null -> no old record so oldmap is null.
    }
    if (Trigger.isBefore && Trigger.isUPdate ) {
        system.debug('==BEFORE Update==');
        system.debug('trigger.newMap -> ' + trgNewMap); //yes
        system.debug('trigger.oldMap -> ' + trgoldMap); //yes
    }
    if (Trigger.isAfter && Trigger.isUpdate ) {
        system.debug('==AFTER UPDATE==');
        system.debug('trigger.newMap -> ' + trgNewMap); //yes
        system.debug('trigger.oldMap -> ' + trgoldMap); //yes
    }




/*
    if (Trigger.isBefore && Trigger.isInsert) {
        //old is null in insert
        system.debug('trigger.old before insert --> ' + trigger.old);
    }

    if (Trigger.isafter && Trigger.isInsert) {
        //old is null in insert
        system.debug('trigger.old after insert --> ' + trigger.old);
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('trigger.old before udpate --> ' + trigger.old);
    }

    if (Trigger.isafter && Trigger.isUpdate) {
        system.debug('trigger.old after update --> ' + trigger.old);
    }
    system.debug('==== trigger end ====');



    /*
    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('trigger.new before insert --> ' + trigger.new); // value is present( not null ) but ID is null
    }

    if (Trigger.isafter && Trigger.isInsert) {
        system.debug('trigger.new after insert --> ' + trigger.new);//present, ıd also present 
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('trigger.new before udpate --> ' + trigger.new);//yes
    }

    if (Trigger.isafter && Trigger.isUpdate) {
        system.debug('trigger.new after update --> ' + trigger.new);//yes
    }
    system.debug('==== trigger end ====');


    /*
   //isAfter will be true in 'after insert' and 'after update' trigger
    List<account> newAccounts = trigger.new;
    if(trigger.isAfter && trigger.isInsert){
        //trigger.new we get latest inserted/updated records
        system.debug('after trigger, new data --> ' + newAccounts);
        system.debug('number of records inserted/updated: ' + newAccounts.size() );

        for (account eachAccount : newAccounts) {
            System.debug('*** account id is' + eachAccount.Id + 'account name is ' + eachAccount.Name);
        }


    }

    system.debug('==== trigger end ====');

/*
    if(Trigger.isBefore){
        system.debug('we are in BEFORE trigger.');
        if(Trigger.isInsert){
            system.debug('before insert trigger called.');
        } 
        if(trigger.isUpdate){
            system.debug('before update trigger called.');
        }
    }
    if(Trigger.isAfter){
        system.debug('we are in AFTER trigger. SBNC');
        if(Trigger.isInsert){
            system.debug('after insert trigger called.');
        } 
        if(trigger.isUpdate){
            system.debug('after update trigger called.');
        }
    }
    */
/*
    if(trigger.isBefore && trigger.isInsert){
        system.debug('before insert trigger called.');
    }
    if(trigger.isAfter && trigger.isInsert){
        system.debug('after insert trigger called.');
    }
    if(trigger.isBefore && trigger.isUpdate){
        system.debug('before update trigger called.');
    }
    if(trigger.isAfter && trigger.isUpdate){
        system.debug('after update trigger called.');
    }
    
    
*/

    /*
     // system.debug('-------');
    // system.debug('.isInsert --> ' + trigger.isInsert);
    // system.debug('.isUpdate --> ' + trigger.isUpdate);
    // system.debug('-------');

    system.debug('-------');
    system.debug('.isBefore --> ' + trigger.isBefore);
    system.debug('.isAfter --> ' + trigger.isAfter);
    system.debug('-------');

    if(Trigger.isBefore){
        system.debug('before insert account trigger called.');
    }
    if(Trigger.isAfter){
        system.debug('after insert account trigger called.');
    }
    */
   
}