
trigger AccountTrigger on Account (before insert, after insert) {
    if(Trigger.isBefore){
        AccountTriggerHelper.beforeInsertAccount();
    }
    if(Trigger.isUpdate){
        AccountTriggerHelper.beforeUpdateAccount();
    }
}