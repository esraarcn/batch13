@isTest
public with sharing class CaseManagerTest {
    @TestSetup
    private static void makeData(){
        List<Case> cases = new List<Case>();
        for(Integer i = 0; i < 3; i++){
            Case cs = new Case(Subject='Test Subject' + i,
                               Description = 'Test Description' + i,
                               Origin = 'Email',
                               Type = 'Electrical',
                               Priority = 'High',
                               Status = 'New');
            cases.add(cs);
        }
        insert cases;
    }

    @isTest
    private static void getCaseTest(){
        // 1. Prepare RestRequest
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
        Case cs = [SELECT Id, Subject, Priority FROM Case LIMIT 1];

        RestRequest request = new RestRequest();
        //Endpoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Case/5008d00000Jey96AAB
        request.requestURI = homeUrl + '/services/apexrest/Case/' + cs.Id;
        request.httpMethod = 'GET';
        // 2. Prepare RestContext
        RestContext.request = request;

        // 3. Test and assert the business method 
        Case objCase = CaseManager.getCaseById();
        System.assertEquals(cs.Id, objCase.Id);
        System.assertEquals(cs.Subject, objCase.Subject);

    }
    @isTest
    private static void postCaseTest(){
        // 1. Prepare RestRequest
        Case cs = new Case(Subject='Test Subject',
                           Description = 'Test Description',
                           Origin = 'Email',
                           Type = 'Electrical',
                           Priority = 'High',
                           Status = 'New');

        String body = JSON.serialize(cs);

        RestRequest request = new RestRequest();
        request.requestBody = Blob.valueOf(body);

        request.httpMethod = 'POST';

        // 2. Prepare RestContext
        RestContext.request = request;

        // 3. Test and assert the business method
        Id caseId = CaseManager.postCase();

        //Assert

        Case resultCase = [SELECT Id, Subject, Description FROM Case WHERE Subject = 'Test Subject' LIMIT 1];
        System.assertEquals('Test Description', resultCase.Description);
        System.assertNotEquals(null, resultCase.Id);
    }

    @isTest
    private static void putCaseTest(){

        //Scenerio-1 = Insert Operation
        // Test the method
        Id caseId = CaseManager.putCase(null, 'Test Put Subject', 'Electrical', 'High');
        // Assertion
        System.assertNotEquals(null, caseId);
        Case cs1 = [SELECT Subject, Type, Priority FROM CASE WHERE Id =:caseId];
        System.assertEquals('Test Put Subject', cs1.Subject);


        //Scenerio-2 = Update Operation
        Id sameCaseId = CaseManager.putCase(caseId, 'Test Put Subject-Changed', 'Mechanichal', 'Low');

        System.assertEquals(caseId, sameCaseId);
    }
}