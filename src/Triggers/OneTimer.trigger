
trigger OneTimer on Account (after insert, after update) {
    if(FlagClass.flag){
    //do some logic
        FlagClass.flag = false;
    }
}