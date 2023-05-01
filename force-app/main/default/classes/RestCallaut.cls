public with sharing class RestCallaut{


    // endpoint :https://th-apex-http-callout.herokuapp.com/animals
    // HTTP method : Get
    public static HttpResponse getAnimal(){
        // 1.Prepare HttpRequest and wrap all the necessary data in it.
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');

/*
        string username = 'ozhan@test.com';
        string password = 'Test1234';
        Blob requestBlob = Blob.valueOf(username + ':' + password);
        String authorizationString = 'BASIC' + EncodingUtil.base64Encode(requestBlob);
        Request.setHeader('Authorization', authorizationString);
*/

        // 2. Prepare Internet
        Http http = new Http();
        // 3. Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(Request);
        // 4. Process HttpResponse
        system.debug(response.getStatusCode());
        system.debug(response.getBody());

        return response;


    }

    public static HttpResponse getAirlines(){
        // 1.Prepare HttpRequest and wrap all the necessary data in it.
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines');
        request.setMethod('GET');
        // 2. Prepare Internet
        Http http = new Http();
        // 3. Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(Request);
        // 4. Process HttpResponse
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
        }
        
        return response;

    }

    public static HttpResponse getEmployees(){
        // 1.Prepare HttpRequest and wrap all the necessary data in it.
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        request.setMethod('GET');
        // 2. Prepare Internet
        Http http = new Http();
        // 3. Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(Request);
        // 4. Process HttpResponse
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            //system.DEBUG(jsonString);

            //Deserialize Json format message to Apex Format
            EmployeeResponse empRes = (EmployeeResponse) JSON.Deserialize(jsonString, EmployeeResponse.class);

            List<EmployeeResponse.EmployeeWrapper> empData = empRes.data;

            List<Employee__c> employees = new List<Employee__c>();
            
            for(EmployeeResponse.EmployeeWrapper wrap : empData){
                Employee__c emp = new Employee__c();
                emp.Name = String.valueOf(wrap.id);
                emp.User_Name__c = wrap.username;
                emp.Name__c = wrap.name;
                emp.Email__c = wrap.email;
                emp.Gender__c = wrap.gender;
                emp.Designation__c = wrap.designation;
                emp.Phone__c = wrap.phone_number;
                emp.Address__c = wrap.complete_address;

                employees.add(emp);
            }

            try{
                insert employees;
            }catch(Exception ex){
                System.debug(ex.getMessage());
            }
       }

       return response;
    }

    public static HttpResponse postEmployee(){
        //1. prepare HttpResponse with the body
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        request.setMethod('POST');
        //1.a. set a header based on the body type
        request.setHeader('Content-Type', 'application/json');

        EmployeeResponse.EmployeeWrapper ew = new EmployeeResponse.EmployeeWrapper();
        ew.name = 'John Smith';
        ew.username = 'blackhead';
        ew.email= 'js@gmail.com';
        ew.gender = 'Male';
        ew.designation = 'Slesforce Developer';
        ew.phone_number = '98362354872';
        ew.complete_address = '8947 Howell Mountains\nSouth Kavon, VT 89670-8443';

        String jsonBody = JSON.serialize(ew);

        //1.b. set body for request 
        Request.setBody(jsonBody);

        //2. prepare internet
        Http http = new Http();

        //3. send request and handle response
        HttpResponse response = http.send(Request);

        //4. process HttpResponse
        system.debug(response.getStatusCode());
        if(response.getStatusCode() == 200){
          String jsonString = response.getBody(); 
          system.debug(jsonString);     

          EmployeePostResponse epr = (EmployeePostResponse) JSON.Deserialize(jsonString, EmployeePostResponse.class);
          System.debug(epr);  



        }

        return response;

    }


        // endpoint : https://api.onlinewebtutorblog.com/employees/1
        // Http Method : delete

        public static HttpResponse  deleteEmployee(){
             
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees/1');
        request.setMethod('DELETE');

        Http http = new Http();
        HttpResponse response = http.send(Request);
        if(response.getStatusCode() == 200){
          String jsonString = response.getBody();
          system.debug(jsonString); 

          EmployeeResponse emr = (EmployeeResponse) JSON.Deserialize(jsonString, EmployeeResponse.class);

          system.debug(emr.msg);



        }
        return response;

        
        }
    }