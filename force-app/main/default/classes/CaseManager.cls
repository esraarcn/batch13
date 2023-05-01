//Endpoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Case/
@RestResource(urlMapping = '/Case/*')
global with sharing class CaseManager {
    
    /**
        *  This method is exposing Case record by their Salesforce Id
        * Endpoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Case/5008d00000Jey96AAB
        * Http Method : GET
    */
    @HttpGet
    global static Case getCaseById(){
        //grab the caseId from the end of the URL
        RestRequest request = RestContext.request;
        String uri = request.requestURI;

        Integer lastIndex = uri.lastIndexOf('/'); //to find the index of last "/" character
        Id caseId = uri.substring(lastIndex+1);

        Case cs = [SELECT Id, CaseNumber, Subject, Description, Type, Priority
                   FROM Case
                   WHERE Id =: caseId];
        return cs;
    }   

    /**/
    /*
    * this method will create a new record
    * we need a body part in Json format
    * Endpoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Case
    * Http Method : PUT
    * return : Case Id
    */

    @HttpPost
    global static Id postCase(){
        //1. get incoming rest callout request context
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        //2. deserialize request body to Case Subject
        Case cs = (Case) JSON.deserialize(body, Case.class);
        //3. insert Case record to SF Org
        insert cs;
        return cs.id;
        
    }

    // Endpoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Case
    // Http Method : update - @HttpPatch 

    @HttpPatch
    global static Case patchCase(){
        //1. get incoming rest callout request context
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        //2. deserialize request body to Case Subject
        Case cs = (Case) JSON.deserialize(body, Case.class);

        update cs;
        return cs;
}

    // Endpoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Case
    // Http Method : update - @HttpPut 

    @HttpPut
    global static Id putCase(String Id, String Subject , String Type, String Priority){
    
        Case cs = new Case();
        cs.Id = Id;
        cs.Subject = Subject;
        cs.Type = Type;
        cs.Priority = Priority;

        upsert cs;
        return cs.Id;
}

    // EndPoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Case/5008d00000Jey96AAB
    // Http Method:@HttpDelete
    @HttpDelete
    global static String deleteCase(){
        // To handle Case Id
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        Integer lastIndex = uri.lastIndexOf('/');
        Id caseId = uri.substring(lastIndex + 1);
        // Delete Case Record
        try{
            Case cs = [SELECT Id FROM Case WHERE Id = : caseId];
            delete cs;
        }catch(Exception ex){
            return 'Fail';
        }
        return 'Success';
    }
}