public class SoqlDemo {
    public static void accountSOQL_1() {
        List<account> listAccount = [select id, name from account];
        System.debug('list of accounts ' + listAccount);
    }

    public static void accountSOQL_11() {
        account acc =[select id, name, phone from account order by CreatedDate desc limit 1];
        System.debug('account record ' + acc);
    }

    public static void accountSOQL_2() {
        account acc =[select id, name, phone, AccountNumber from account order by CreatedDate desc limit 1];
        System.debug('latest created account record ' + acc); 
        //print phone name and accountnumber
        String aName = acc.Name;
        String aPhone = acc.Phone;
        System.debug('account name ' + aName + 'account phone ' + aPhone + ' account number is ' + acc.AccountNumber);
    }

    public static void accountSOQL_3() {
        List<account> listAccount = [select id, name, phone, AccountNumber from account order by CreatedDate desc];
        
        for (account eachAcc : listAccount) {
            System.debug(' each acc start ');
            System.debug('each acc : ' + eachAcc);
            String accName = eachAcc.Name;
            String accPhone = eachAcc.Phone;
            System.debug(' accName ' + accName + 'phone ' + accPhone + 'account number is ' + eachAcc.AccountNumber);
            System.debug(' each acc end ');
        }


    }

    public static void account_soqlFilter() {
        String accountName = 'GenePoint';
        List<account> listacc =[select name, phone from account where name = :accountName];
        System.debug('filter1: ' + listacc);
    }
    public static void account_soqlFilter(String accountName) {
        List<account> listacc =[select name, phone from account where name = :accountName];
        System.debug('filter1: ' + listacc);
}

    public static void childToParent_SOQL1() {
        List<contact> listContacts = [select id, name, account.name, account.industry from contact where account.industry = 'energy'];
        for (contact eachContact : listContacts) {
            string accName = eachContact.Account.Name;
            System.debug('contact name is ' + eachContact.Name + ' , its account name is ' + accName + 'and acc industry is ' + eachContact.Account.industry);
        }
    }
    public static void parentToChild_SOQL1li() {
        List<account> listAccount = [select name, type, (select name, amount from Opportunities where stagename = 'Closed Won') from account where type = 'customer - direct'];
    }
    public static void parentToChild_SOQL1() {
        List<account> listAccount = [select name, type, annualrevenue, (select name, amount from Opportunities where stagename = 'Closed Won') from account where type = 'customer - direct'];

        for (account eachAcc : listAccount) {
            System.debug('account name is ' + eachAcc.Name + 'its annual revenue is ' + eachAcc.annualrevenue );
            System.debug('-----');
            List<Opportunity>eachAccOpp = eachAcc.Opportunities;
            for (opportunity eachOpp : eachAccOpp) {
              System.debug('opp name is '+ eachOpp.name + 'and amount ' + eachOpp.amount);  
            }
        }

    }
    /*public static void parentToChild_SOQL2() {
        list<salesforce_project__c> listSP = [select id, name, project_name__c,
                                 (select subject__c, priority__c from salesforce_tickets__r) 
                                 from salesforce_project__c];
        //we need to print two things.
             //1. total number of tickets in each Project.
             //2. high priority tickets in each project.
        for (salesforce_project__c eachSP : listSP) {
             //get all tickets of each project in List<salesforce_ticket__c>
             list<salesforce_ticket__c> listST = eachSP.salesforce_tickets__r;
             
             //total number of tickets by using .size() method of list. 
                  //==> 1st requirement is Satisfied.
             integer totalTickets = listST.size();
             //2. high priority tickets
             integer highPriorityTickets = 0;
             //each ticket and check if priority is high
             for (salesforce_ticket__c eachST : listST) {
                  //checking priority == high
                  if (eachST.Priority__c == 'High') {
                       //increment the counter.
                       highPriorityTickets++;
                  }
             }
             system.debug('Project name is ' + eachSP.Project_Name__c + ', total tickets ' + totalTickets + ', hp tickets ' + highPriorityTickets);
        }
      }*/

    public static void parentToChild_SOQL2() {
        List<salesforce_project__c>listSP = [select id, name, project_name__c, (SELECT subject__c,priority__c FROM salesforce_tickets__r )FROM salesforce_project__c];

        for (salesforce_project__c eachSP : ListSP) {
            List<salesforce_ticket__c>listST = eachSP.salesforce_tickets__r;
            System.debug('list ST ' + listST);
            Integer totalTicteks = listST.size();
            Integer highPriorityTickets =0;
            for (salesforce_ticket__c eachST : listST) {
               if (eachST.priority__c== 'high') {
                highPriorityTickets++;
               }
               System.debug('project name is ' + eachSP.project_name__c + ' , total tickets ' + totalTicteks + ', hp tickets ' + highPriorityTickets);
               

            }

        }

    }


}