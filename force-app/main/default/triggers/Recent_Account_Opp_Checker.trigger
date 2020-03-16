trigger Recent_Account_Opp_Checker on Account (before update) {
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            Recent_Account_Opp_Checker_class.updater(Trigger.New);
        }
    }
}