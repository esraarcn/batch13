Map<String,country_code__c> mapCountryCode = country_code__c.getAll();
system.debug(mapCountryCode);

//print 'country name is united states its code is USA'

for(string eachName : mapCountryCode.keySet()){
    country_code__c c = mapCountryCode.get(eachName);
    system.debug('country name is '+ eachName + 'its code is ' + c.code__c);
}

country_code__c c1 = country_code__c.getInstance('India');
system.debug('c1 code is ' + c1.code__c);