@isTest
public with sharing class SoapCalloutsTest {
   @isTest
   private static void parksCalloutTest() {
    //1. set the mock 
     ParksServiceMock mock =new ParksServiceMock();
     test.setMock(WebServiceMock.class, mock );

     //2. test the class
     String[] parks = SoapCallouts.parksCallout('United States');

     //3. do asserts
     System.assertEquals(3, parks.size());
   } 
   @isTest
   private static void doAddCalloutTest() {
    //1. set the mock 
     DoAddCalloutMock mock =new DoAddCalloutMock();
     test.setMock(WebServiceMock.class, mock );

     double result = SoapCallouts.doAddCallout(20, 25);
     
     System.assertEquals(45, result);

}
}