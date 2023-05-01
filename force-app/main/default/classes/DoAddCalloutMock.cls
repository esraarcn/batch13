public with sharing class DoAddCalloutMock implements WebServiceMock {
        public Void doInvoke(Object stub, 
                             Object soapRequest, 
                             Map<String,Object> responseMap, 
                             String endpoint, 
                             String soapAction, 
                             String requestName, 
                             String responseNamespace, 
                             String responseName, 
                             String responseType){
     CalculatorServices.doAddResponse response_x = new CalculatorServices.doAddResponse(); 
     response_x.return_x = 45;
     responseMap.put('response_x' , response_x);                     
}
}