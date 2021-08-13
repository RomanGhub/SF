
global with sharing class Scheduler implements Schedulable {
    global void execute(SchedulableContext ctx) {
         //Database.executeBatch(new Batch());
        String cronStr1 = '0 0,30 * * * *';
        String cronStr2 = '0 0,0 * * * *';
        System.schedule('Process batch1', cronStr1, new Batch());
        System.schedule('Process batch1', cronStr2, new Batch());
        System.schedule('Process batch2', cronStr1, new Batch2());
        System.schedule('Process batch2', cronStr2, new Batch2());
    }

}