@RestResource(urlMapping = '/Contact/*')
global with sharing class ContactManager {
    //Endpoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Contact/

    @HttpGet
    global static Contact getContactById(){
        //grab the caseId from the end of the URL
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        Integer lastIndex = uri.lastIndexOf('/'); //to find the index of last "/" character
        Id contactId = uri.substring(lastIndex+1);
        Contact cs = [SELECT Id, FirstName, LastName, Title, Email, Department
                   FROM Contact
                   WHERE Id =: contactId];
        return cs;
    }
    /*   This method will create a new case record.
    * We need a body part in JSON format
    * Endpoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Case
    * Http Method: Post - @HttpPost
    * Return : Case Id
    */
    @HttpPost
    global static Id postContact(string FirstName, string LastName, string Title, string Email, string Department){
        // 1. Get Incoming REST Callout request context
    Contact con =new Contact();
    con.FirstName= FirstName;
    con.LastName=LastName;
    con.Title =Title;
    con.Email= Email;
    con.Department= Department;
    insert con;
    return con.Id;
    }
    // EndPoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Case
    // Http Method: Update - @HttpPatch
    @HttpPatch
    global static Contact patchContact(){
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Contact cs = (Contact) JSON.deserialize(body, Contact.class);
        update cs;
        return cs;
    }
      // EndPoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Case
    // Http Method: Upsert - @HttpPut
   @HttpPut
    global static Id putContact(String Id, string FirstName, String LastName, String Title, string Email, string Department){
        Contact cnt = new Contact();
        cnt.Id=id;
        cnt.FirstName= FirstName;
        cnt.LastName= LastName;
        cnt.Title= Title;
        cnt.Email= Email;
        cnt.Department=Department;
        upsert cnt;
        return cnt.id;
    }
    // EndPoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Case
    // Http Method:HttpDelete*/
   @HttpDelete
    global static  string deleteContact(){
    //t handle
        RestRequest request  = RestContext.request;
        string uri = request.requestURI;
        Id contactId = uri.substringAfterLast('/');
        contact cnt =[select id from Contact where id = :contactId];
        delete cnt;
        return 'contact has been deleted successfully.';
} 
}



















