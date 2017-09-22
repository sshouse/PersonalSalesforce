// Look for duplicate contacts based one email
//Populate a Dupe_Contact__c field with the Contact if found
trigger DetectDupes on Lead (before insert, before update) {

    for (Lead l : Trigger.new) {
        //Make sure lead has an email address
        if(l.Email != null){
            //Find a dupe
            String leadEmail = l.Email;
            List<Contact> dupeContacts = [Select Id FROM Contact WHERE Email =:leadEmail];
            //If dupe is found, update a field
            if (dupeContacts.size() >0){
                l.Dupe_Contact__c = dupeContacts[0].Id;
            } else {
                l.Dupe_Contact__c = null;
            }
        }else {
                l.Dupe_Contact__c = null;
        }
    }
}