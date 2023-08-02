public with sharing class Calculator_LWC {
    
    @AuraEnabled
    public static Integer calculateImperative(Integer a, Integer b,String operation){
        Integer result = 0;
        if(operation.equals('Add')){
            result = a+b;
        }
        if(operation.equals('Sub')){
            result = a-b;
        }
        if(operation.equals('Multiply')){
            result = a * b;
        }
        if(operation.equals('Divide')){
            result = a / b;
        }
        return result;
    }

}