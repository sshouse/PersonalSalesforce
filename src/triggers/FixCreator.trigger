// Email-to-Case always defaults the creator - this fixes that!
trigger FixCreator on Case (before insert) {

  // Step 1: Create a set of all emails of Users to query
  Set<String> allEmails = new Set<String>();
  for (Case newCase : Trigger.new) {
    if (newCase.SuppliedEmail != null) {
      allEmails.add(newCase.SuppliedEmail);    }
  }

  // Step 2: Query for all the Users in Step 1
  List<User> potentialUsers = [SELECT Id, Email FROM User
                                 WHERE Email IN :allEmails];

  
  // Step 3: Make a Map that lets you search for Users by Email
  Map<String, User> emailToUserMap = new Map<String, User>();
  for (User u : potentialUsers) {
    emailToUserMap.put(u.Email, u);
  }
  
  // Step 4: Get the matching user in the Map by Email!
  for (Case newCase : Trigger.new) {
    if (newCase.SuppliedEmail != null) {
      User creator = emailToUserMap.get(newCase.SuppliedEmail);
      if (creator != null) {
        newCase.OwnerId = creator.Id;
      }
    }
  }

}