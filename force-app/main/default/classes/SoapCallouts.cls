public with sharing class SoapCallouts {
        public static String[] parksCallout(String country){
            ParksServices.ParksImplPort parkService = new ParksServices.ParksImplPort();
            String[] parks = parkService.byCountry(country);
            return parks;
        } 
        public static Double doAddCallout(Double num1, double num2) {
            CalculatorServices.CalculatorImplPort calcService= new   CalculatorServices.CalculatorImplPort();
            double result =  calcService.doAdd(num1, num2);  
            System.debug(result);
            return result;   
    }
    
        public static Double doDivideCallout(Double num1, double num2) {
            CalculatorServices.CalculatorImplPort calcService= new   CalculatorServices.CalculatorImplPort();
            double result =  calcService.doDivide(num1, num2);  
            System.debug(result);
            return result;   
}
}