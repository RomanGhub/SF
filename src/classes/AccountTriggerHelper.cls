
global with sharing class AccountTriggerHelper {

    private static List<Id> accs = new List<Id>();

    global static void beforeInsertAccount(List<Account> newA, List<Account> oldA){ //Map<Id, Account> newAcc
        for(Account a : newA) {
            if(!oldA.contains(a)){
                accs.add(a.Id);
            }
        }
        AccountTriggerHandler.logic(accs);
    }

    global static void beforeUpdateAccount(List<Account> newA, List<Account> oldA){
        //Map<Id, Account> oldAcc, Map<Id, Account> newAcc
    /*    for(Account acc : newAcc.values()) {
            if(!acc.BillingAddress.equals(oldAcc.get(acc.Id).BillingAddress)) {
                accIds.add(acc.Id);
            }
        }*/
        for(Account a : newA) {
           if(!oldA.contains(a)){
                accs.add(a.Id);
            }
        }
        AccountTriggerHandler.logic2(accs);
    }
}