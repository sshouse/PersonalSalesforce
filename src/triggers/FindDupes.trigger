trigger FindDupes on Lead (before insert, before update) {
 /*   for (Lead myLead : Trigger.new){
        if (myLead.email != null){
            List<Contact> dupes = [SELECT Id FROM Contact Where Email = :myLead.Email];
            if(dupes.size()>0){
                String errorMessage= 'Duplicate contact found!';
                errorMessage +='Record ID is ' + dupes[0].Id;
            myLead.addError(errorMessage);
            }
        }
    }*/
}