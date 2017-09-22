@isTest
public class TestFindDupes{
    static testMethod void testDupes(){
        Contact c = new Contact();
        c.FirstName = 'Joe';
        c.LastName = 'Blow';
        c.Email = 'joe.blow@gmail.com';
        insert c;
        
        Lead dupeLead = new Lead();
        dupeLead.FirstName = 'Joseph';
        dupeLead.LastName = 'Blow';
        dupeLead.Company = 'The Candy Factory';
        dupeLead.Email = 'joe.blow@gmail.com';
        
        try{
            insert dupeLead;
        }
        catch (Exception e){
            System.debug('An Error Happened as expected');
        }
	List<Lead> dupes = [SELECT Id FROM Lead WHERE Email = 'joe.blow@gmail.com'];
    System.assertEquals(0,dupes.size());
        Lead legitLead = new Lead() ;
        legitLead.FirstName = 'Carol';
        legitLead.LastName = 'Wilgus';
        legitLead.Company  = 'Stardust Inc.';
        legitLead.email = 'carol.wilgus@stardust.com';
        insert legitLead;
        
        LIST <Lead> legits = [SELECT Id FROM Lead WHERE Email ='carol.wilgus@stardust.com'];
        System.assertEquals(1,legits.size());
    }
}