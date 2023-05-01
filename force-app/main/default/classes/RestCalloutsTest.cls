@isTest
public with sharing class RestCalloutsTest {
    @isTest
    private static void getAnimalsTest() {
        //1. set the Mock 
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. test the Mock
        HttpResponse response = RestCallaut.getAnimal();

        //3. run Asserts
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
    }

    @isTest
    private static void getEmployeesTest() {
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);
        
        HttpResponse response = RestCallaut.getEmployees();

        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
    }

    @isTest
    private static void postEmployeeTest() {
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);
        
        HttpResponse response = RestCallaut.postEmployee();

        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
    }

    @isTest
    private static void deleteEmployeeTest() {
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);
        
        test.startTest();
        HttpResponse response = RestCallaut.deleteEmployee();
        test.stopTest();
        
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('{"error":0,"msg":"data deleted successfully","data":[]}', response.getBody());
    }


}