public with sharing class ContactController_LWC {
    
    @AuraEnabled
    public static List<Contact> getContacts(){
        return [Select FirstName,LastName,Email from Contact LIMIT 5];
    }

    //Imperative - cacheable = true is not mandatory, but for wire it is mandatory
    @AuraEnabled(cacheable=true)
    public static List<Contact> searchContacts(String searchString){
        List<Contact> contacts = new List<Contact>();
        if(!searchString.isWhitespace() && searchString.length() > 3){
            searchString = '%'+searchString+'%';
            contacts = [Select FirstName,LastName,Email from Contact where FirstName LIKE: searchString OR LastName LIKE: searchString];
        }
        
        return contacts;

    }


}