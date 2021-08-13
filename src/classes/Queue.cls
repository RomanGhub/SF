
public with sharing class Queue implements Queueable {
    public void execute(QueueableContext context) {
        for (Contact c: [SELECT id, name,Is_Synced__c from Contact]){
            c.Is_Synced__c = false;
            c.Processed_By_Future__c = true;
        }
    }
}