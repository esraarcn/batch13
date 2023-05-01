public with sharing class RestPostCallout {
    public static HttpResponse postPost(){
        //1. Prepare HttpRequest with body
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://gorest.co.in/public/v2/posts');
            request.setMethod('POST');
            //1.a. Set header based on the body type
            Posts__c  pst= [select User_ID__c,Title__c, Body__c from   Posts__c where CreatedDate = TODAY limit 1];
        WrapperPst wps = new  WrapperPst();
        wps.user_id =Integer.valueOf(pst.User_ID__c);
        wps.title=pst.Title__c;
        wps.body=pst.Body__c;
        String jsonBody = JSON.serialize(wps);
        request.setBody(jsonBody);
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            request.setHeader('Authorization', 'Bearer d1c8bf16d036585c144430c28081d61b7d81be1a4d5fc3cd6f5b2da307562ad5');
            //2. Prepare Internet
            Http http = new Http();
            //3. Send request and handle response
            HttpResponse response = http.send(request);
            //4. Process HttpResponse
            System.debug(response.getStatusCode());
            if(response.getStatusCode() == 201){
           System.debug( response.setBody() );
            } else{
                System.debug('an error occured while sending a post.');
            }
            return response;
        }
}