
public with sharing class Batch implements Database.Batchable<SObject>/*Task*/, Schedulable{
    public Database.QueryLocator /*| Iterable<sObject>*/ start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator([SELECT id from Task where Is_Synced__c = FALSE ]);
    }
    public void execute(Database.BatchableContext bc, List<Task> records){
        // process each batch of records
        //Batch should copy from Account.Owner.Name to Task.AccountOwner__c
        for(Task t: records){
            t.Is_Synced__c = true;
        }
        try { update records; } catch(DmlException e) {
            System.debug('can`t update the damn list');
        }

    }
    public void execute(System.SchedulableContext sc){  ///// CHTO ETO
        // process each batch of records
        //Batch should copy from Account.Owner.Name to Task.AccountOwner__c
   /*     for(Task t: records){
            t.Is_Synced__c = true;
        }
        update records;*/
    }

    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}