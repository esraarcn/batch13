public with sharing class RestCalloutsMock implements HttpCalloutMock{
   public HttpResponse respond (HttpRequest request){
       if(request.getEndpoint() == 'https://th-apex-http-callout.herokuapp.com/animals' && request.getMethod() == 'GET'){
           HttpResponse response = new HttpResponse();
           response.setStatusCode(200);
           response.setStatus('OK');
           response.setHeader('Content-Type', 'application/json;charset=UTF-8');
           response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}');
           return response;
       }else if(request.getEndpoint() == 'https://api.onlinewebtutorblog.com/employees' && request.getMethod() == 'GET'){
           HttpResponse response = new HttpResponse();
           response.setStatusCode(200);
           response.setStatus('OK');
           response.setHeader('Content-Type', 'application/json;charset=UTF-8');
           response.setBody('{"error":0,"msg":"data found","data":[{"id":1,"username":"ebahringer","name":"Braulio Luettgen","email":"kaela.turner@example.net","gender":"Female","designation":"Mean Stack Developer","phone_number":"781.322.7616","complete_address":"298 Edythe Harbors Suite 697 Lake Mathiasburgh, MN 28564-6386"},{"id":2,"username":"moore.samanta","name":"Christian Kessler","email":"summer.koepp@example.com","gender":"Male","designation":"Freelancer","phone_number":"509-549-9565","complete_address":"8947 Howell MountainsSouth Kavon, VT 89670-8443"}]}');
           return response;
       }else if(request.getEndpoint() == 'https://api.onlinewebtutorblog.com/employees' && request.getMethod() == 'POST'){
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setStatus('OK');
        response.setHeader('Content-Type', 'application/json;charset=UTF-8');
        response.setBody('{"error":0,"msg":"data created","data":{"username":"blackhead","phone_number":"98362354872","name":"John Smith","id":101,"gender":"Male","email":"js@gmail.com","designation":"Salesforce Developer","complete_address":"8947 Howell Mountains South Kavon, VT 89670-8443"}}');
        return response;
       } else if(request.getEndpoint() == 'https://api.onlinewebtutorblog.com/employees/1' && request.getMethod() == 'DELETE'){
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setStatus('OK');
        response.setHeader('Content-Type', 'application/json;charset=UTF-8');
        response.setBody('{"error":0,"msg":"data deleted successfully","data":[]}');
        return response;
       
   }
   return null;
}
}