List<contact> listContact = [select id, name, account.id, account.name from contact];
    System.debug(listContact);
    for(contact eachContact : listContact){
        System.debug('account name: ' + eachContact.Account.Name + 'account ID: ' + eachContact.Account.Id);
    }

List<account> listAccount = [select id, name (select id, name from contacts) from account];
    System.debug(listAccount);
    for (account eachAccount : listAccount ) {
        System.debug('contact name: ' + )
    }   