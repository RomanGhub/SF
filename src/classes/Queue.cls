
public with sharing class Queue implements Queueable {
    public void execute(QueueableContext context) {
        List<Contact> cont = [SELECT Id, Name,Is_Synced__c FROM Contact];
        for (Contact c: cont){
            c.Is_Synced__c = false;
            c.Processed_By_Future__c = true;
        }
        try { update cont; } catch(DmlException e) {
            System.debug('can`t update the damn list');
        }
    }
}