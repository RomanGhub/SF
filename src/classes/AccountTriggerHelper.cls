
global with sharing class AccountTriggerHelper {

    //private static List<Id> accIds = new List<Id>();

    global static void beforeInsertAccount(){ //Map<Id, Account> newAcc
     /*   for(Account acc : newAcc.values()) {
            accIds.add(acc.Id);
        }*/
        AccountTriggerHandler.logic(/*accIds*/);
    }

    global static void beforeUpdateAccount(){ //Map<Id, Account> oldAcc, Map<Id, Account> newAcc
    /*    for(Account acc : newAcc.values()) {
            if(!acc.BillingAddress.equals(oldAcc.get(acc.Id).BillingAddress)) {
                accIds.add(acc.Id);
            }
        }*/
        AccountTriggerHandler.logic2(/*accIds*/);
    }
}