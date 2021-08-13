
global with sharing class Updater {
    //@InvocableMethod
    global static void doUpdate(Account acc) {
        //for(Account a : acc) {
            if (acc != null && acc.Tasks.size() > 3) {
                Integer count = [SELECT COUNT() FROM User];
                Integer rand = Math.floor(Math.random() * count).intValue();
                User u = [SELECT Id FROM User LIMIT 1 OFFSET :rand];
                for(Task t : acc.Tasks){
                    t.OwnerId = u.Id;
                }
                try { update u; } catch(DmlException e) {
                    System.debug('can`t update the damn list');
                }
                //[SELECT Id FROM User WHERE Id = 1];
            }
        //}
    }
}
