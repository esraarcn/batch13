@isTEst
public class DmlDemoAgainTest {
    @istest
    private static void testInsertStdObj() {
        DmlDemoAgain.dmlInsertDemo_stndObj(); //if this method works correctly, 
        //then we would GET one record in soql
        //
        account acc = [select id, name from account where name = 'softinnovas' limit 1];
        system.assert(acc != null);
        system.assertEquals('softinnovas', acc.Name);
    }
    @istest
    public static void testInsertCstObj() {
        //call method
        DmlDemoAgain.dmlInsertDemo_cstmObj();
        // soql and assert
        List<salesforce_Project__c>ListSp = [select id, name, project_name__c FROM salesforce_Project__c WHERE project_name__c= 'Learn dml batch 13' ];
        System.assertEquals(1, ListSp.size());
        assert.areEqual(1, listSP.size());
    }
    @isTest
    private static void testUpdateDemo_stndObj3() {
        //1. prepare required data
        Account acc = new account();
        acc.Name = 'softinnovas';
        insert acc;
        
        //call method to test
        DmlDemoAgain.dmlUpdateDemo_stndObj3();

        //how can we verify?
        //assertion.
        //Fetch the updated record by SOQL
        Account updatedAcc =  [select id, name, phone from account limit 1];
        system.assertEquals('SoftInnovas Inc.', updatedAcc.Name);
        assert.areEqual('SoftInnovas Inc.', updatedAcc.Name );
        assert.areEqual('9556789451', updatedAcc.phone);
    }
    @istest
    private static void testInsertDemo_stndObj2() {
        //1. prepare required data
        Account acc = new account();
        acc.Name = 'Softinnovas';
        insert acc;

        //call method to test
        DmlDemoAgain.dmlInsertDemo_stndObj2();
        //how to verify?
        //soql
        contact c = [select id, lastname, accountid from contact where lastname = 'Biden'];
        //assertion
        assert.areEqual(acc.id, c.AccountId);
        system.assert(c != null);

    }
    @isTest
    private static void testInsertDemo_cstmObj2() {
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c= 'test sp';
        insert sp;
        DmlDemoAgain.dmlInsertDemo_cstmObj2();
        Salesforce_Ticket__c st =[select subject__c,Priority__c,Salesforce_Project__c from Salesforce_Ticket__c where subject__c = 'create related record'];
        assert.areEqual(sp.id,st.Salesforce_Project__c );
    }
}