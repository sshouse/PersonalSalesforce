@isTest
public class TestDeduper{
    static testMethod void testDupes(){
        //Principle #1: Create records from scratch!
        Contact dupeContact = new Contact();
        dupeContact.LastName = 'Spiderman';
        dupeContact.Email = 'spiderman@gmail.com';
        insert dupeContact;
        
        Lead dupeLead = new Lead();
        dupeLead.FirstName ='Peter';
        dupeLead.LastName = 'Parker';
        dupeLead.Company = 'Daily Bugle';
        dupeLead.Email = 'spiderman@gmail.com'; 
        insert dupeLead;
        
        //Principle #2: Use System.assertEquals()
        dupeLead = [SELECT Id, Dupe_Contact__c FROM Lead
                   WHERE Email =:dupeLead.Email LIMIT 1];
        System.assertEquals(dupeContact.Id, dupeLead.Dupe_Contact__c);
        
        //Principle #3: Test things that shouldn't work!
        Lead uniqueLead = new Lead();
        uniqueLead.LastName = 'Xavier';
        uniqueLead.Company = 'X-Men';
        uniqueLead.Email = 'theprofessor@xmen.com';
        insert uniqueLead;
        
        uniqueLead = [SELECT Id, Dupe_Contact__c FROM Lead
                     WHERE Email = :uniqueLead.Email Limit 1];
        System.assertEquals(null, uniqueLead.Dupe_Contact__c);
    }
}