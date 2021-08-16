
public with sharing class AccountTriggerHandler {

    @Future
    public static void logic(/*List<Account> accs*/){
        List<Contact> conts = [SELECT id,Is_Synced__c from Contact];

        for (Contact c: conts/*[SELECT Id, Is_Synced__c FROM Contact]*/){
            c.Is_Synced__c = false;
            c.Processed_By_Future__c = true;
        }
//        update Account;
        try { update conts; } catch(DmlException e) {
            System.debug('can`t update the damn list');
        }

        ID jobID = System.enqueueJob(new Queue());

        Id batchId = Database.executeBatch(new Batch());
        //Id batchId2 = Database.executeBatch(new Batch2());

    }

    @Future
    public static void logic2(List<Id> accids) {
        List<Contact> conts = [SELECT Id,Is_Synced__c FROM Contact WHERE AccountId IN : accids];

        for (Contact c: conts){  /*[SELECT Id, Is_Synced__c FROM Contact]*/
            c.Is_Synced__c = false;
            c.Processed_By_Future__c = true;
        }
        try { update conts; } catch(DmlException e) {       //update Account; так можно ?
            System.debug('can`t update the damn list');
        }


        Id jobID = System.enqueueJob(new Queue());
        Id batchId = Database.executeBatch(new Batch());
        Id batchId2 = Database.executeBatch(new Batch2());
    }
}