String[] parks = SoapCallouts.parksCallout('United States');
System.debug(parks);

String[] parks2 = SoapCallouts.parksCallout('Germany');
System.debug(parks2);

Double result = SoapCallouts.doAddCallout(204.8D, 308.9D);

SoapCallouts.doDivideCallout(204.8D, 308.9D);