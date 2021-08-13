
public with sharing class Tasker {

    @InvocableMethod
    public static void doTask(List<Account> accounts){
//        List<Account> accs = [SELECT Id, Name FROM Account];

        for(Account a: accounts){
            a.Tasks.add(new Task(Subject = 'Negotiations with ' + a.Name));
            Updater.doUpdate(a);
        }
    }

//    if(a.Tasks.size() > 3 /*&& a.is*/){ }
}