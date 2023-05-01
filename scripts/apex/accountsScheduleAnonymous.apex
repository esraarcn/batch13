string crn = '0 0 13 * * ?';

AccountsSchedulable acs = new AccountsSchedulable();
system.schedule('accountSchedule6', crn, acs);