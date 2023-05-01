public with sharing class RestCalloutCase {
    public static HttpResponse getCase() {
        //1. prepare HttpRequest
        HttpRequest Request = new HttpRequest();
        Request.setEndpoint('callout:LastVersion/sevices/apexrest/Case/5008d00000QBaIlAAL');
        Request.setMethod('GET');

        //2. prepare internet
        HTTP http = new HTTP();

        //3. SEND HTTPREQUEST over internet
        HttpResponse response = http.send(request);

        //4. process httpresponse
        if (response.getStatusCode()==200) {
            System.debug( 'Json format :' +response.getBody());
            string body = response.getBody();
            Case cs = (Case)JSON.deserialize(body, Case.class);
            System.debug('Case object : '+ cs);
        }
        return response;
    }
}