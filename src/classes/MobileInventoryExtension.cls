public class MobileInventoryExtension {

   // Constructors. Needed to use as an extension.
   public MobileInventoryExtension(ApexPages.StandardController c) {}
   public MobileInventoryExtension(ApexPages.StandardSetController c) {}

   // Remote Action function lets JavaScript call Apex directly
   // method to update a given Merchandise record passed in from a Visualforce page JavaScript function
   @RemoteAction
   public static String updateMerchandiseItem(String productId, Integer newInventory) {
      // get the target Merchandise sObject
      List<Merchandise__c> m = [SELECT Id, Name, Price__c, Quantity__c from Merchandise__c WHERE Id =:
           productId LIMIT 1];
      // if found, try to update it with the new Quantity
      if(m.size() > 0) {
         m[0].Quantity__c = newInventory;
         try {
            update m[0];
            return 'Item Updated';
         }
         catch (Exception e) {
            return e.getMessage();
         }
      }
      else {
         return 'No item found with that ID';
      }
   }
}