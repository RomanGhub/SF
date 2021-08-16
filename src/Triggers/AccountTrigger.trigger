
trigger AccountTrigger on Account (before insert, before update) {
    if(Trigger.isUpdate){
        AccountTriggerHelper.beforeUpdateAccount(Trigger.new, Trigger.old);
    }
    if(Trigger.isInsert){
        AccountTriggerHelper.beforeInsertAccount();
    }

}