public static HttpResponse postPost() {
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://gorest.co.in/public/v2/posts');
    request.setMethod('POST');

    Posts__c pst = new Posts__c();
    pst = [SELECT User_ID__c, Title__c, Body__c FROM Posts__c WHERE CreatedDate = TODAY LIMIT 1];

    PostWrapper wrpst = new PostWrapper();
    wrpst.user_id = Integer.valueOf(pst.User_ID__c);
    wrpst.title = pst.Title__c;
    wrpst.body = pst.Body__c;

    String jsonBody = JSON.serialize(wrpst);
    request.setBody(jsonBody);
    request.setHeader('Content-Type', 'application/json;charset-UTF-8');
    request.setHeader('Authorization', 'Bearer c67c575eefb84f3029bb11807b8785adbe485d90e27055558122d6c317f0c593');

    Http http = new Http();
    HttpResponse response = http.send(request);
    System.debug(response.getStatusCode());
    System.debug(response.getStatus());
    if (response.getStatusCode() == 201) {
       System.debug(response);
       
    } else {
        System.debug('an error occured while sending a post');
    }
    return response;
}