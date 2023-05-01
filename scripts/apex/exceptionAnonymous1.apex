try {
    account a = new account();
    a.name = 'try catch acc';
    insert a;
} catch (DmlException dmlex) {
    System.debug('dml went wrong buddy');
}catch (Exception ex){
    System.debug('sotething went wrong buddy');
}finally {
    //this will run if there is any error and code goes to catch.
    //this will run if there is NO error in try.
    system.debug('this will always run. ')
}

System.debug('apex is simple');