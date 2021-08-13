
public with sharing class AccountTriggerHandler {

    @Future
    public static void logic(/*List<Account> accs*/){
        List<Contact> conts = [SELECT id,Is_Synced__c from Contact];

        for (Contact c: conts/*[SELECT Id, Is_Synced__c FROM Contact]*/){
            c.Is_Synced__c = false;
            c.Processed_By_Future__c = true;
        }
//        update Account;
        update conts;

        ID jobID = System.enqueueJob(new Queue());

        Id batchId = Database.executeBatch(new Batch());
        //Id batchId2 = Database.executeBatch(new Batch2());

    }

    @Future
    public static void logic2(/*List<Account> accs*/) {
     //TODO
    }
}