
trigger AccountTrigger on Account (before insert, before update) {
    if(Trigger.isUpdate){
        AccountTriggerHelper.beforeUpdateAccount(Trigger.new, Trigger.old);
    } else if(Trigger.isInsert){
        AccountTriggerHelper.beforeInsertAccount(Trigger.new, Trigger.old);
    }

}