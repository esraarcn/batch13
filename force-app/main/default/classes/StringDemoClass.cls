public class StringDemoClass {
    public void StringMethod1() {
        String sessionDescription = 'learning string\'s methods in apex language.';
        System.debug(sessionDescription);
        //1. length
        integer lengthOfStr = sessionDescription.length();
        system.debug('length of session description string: ' + lengthOfStr);

        //2. convert the string to capital letters
        string capitalStr = sessionDescription.toUpperCase();
        System.debug('session description in CAPİTAL: ' + capitalStr);

        //3. check if our string has 'apex' in it
        Boolean containsApex = sessionDescription.contains('apex');
        System.debug('contains apex? ' + containsApex);

           Boolean containsApex2 = sessionDescription.CONTAİNS('Apex');
        System.debug('contains apex 2? ' + containsApex2);

           Boolean containsApex3 = sessionDescription.containsİgnoreCase('APEX');
        System.debug('contains İgnore Case APEX?' + containsApex3);

                Boolean containsSalesforce = sessionDescription.containsIgnoreCase('salesforce');
        system.debug('contains salesforce? => ' + containsSalesforce);

        



    }
}