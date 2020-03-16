trigger RestrictContactByName on Contact (before insert, before update) {
    //check contacts prior to insert or update for invalid data
    For (Contact c : Trigger.New) {
        if(c.FirstName.length() > 8){
            c.addError('This lenght of string is not allowed');
        } else if (c.FirstName.length() == 5){
            c.addError('This is correct size of string');
        }
    }
}