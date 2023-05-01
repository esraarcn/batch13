public with sharing class WeeklyAssignmentCallouts {
    
    @future(callout=true)
    public static void postEmployeeInfo(Id employeeId) {
        //prepare data
        Employee__c emp = [SELECT Name, Username__c, Email__c, Gender__c, Designation__c, Phone_Number__c, Complete_Address__c, Integration_Status__c
                            FROM Employee__c
                            WHERE Id = :employeeId
                            LIMIT 1];
        EmployeeWrapper wrap = new EmployeeWrapper();
        wrap.complete_address = emp.Complete_Address__c;
        wrap.designation = emp.Designation__c;
        wrap.email = emp.Email__c;
        wrap.gender = emp.Gender__c;
        wrap.name = emp.Name;
        wrap.phone_number = emp.Phone_Number__c;
        wrap.username = emp.Username__c;
        String body = JSON.serialize(wrap);

        //1. Prepare HttpRequest and wrap necessary data in it
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet in order to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        emp.Integration_Status__c = Datetime.now()
            + ' ' + response.getStatusCode()
            + ' ' + response.getStatus()
            + ' ' + response.getBody();

        try {
            update emp;
        } catch(Exception ex) {
            //create log
            System.debug(ex.getMessage());
        }
    }
}
