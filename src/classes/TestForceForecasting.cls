@isTest
public class TestForceForecasting {

    static testMethod void insertNewUser() {
	
	User userToCreate = new User();
	//Do you recognize these fields?
	userToCreate.FirstName = 'David';
	userToCreate.LastName = 'Liu';
	userToCreate.Email = 'dvdkliu+sfdc99@gmail.com';
	userToCreate.Username ='test@boondoggle.com';
    userToCreate.Alias = 'fatty';
	userToCreate.ProfileId='00eG000000162YiIAI';
	
	//Don't worry about these
	userToCreate.TimeZoneSidKey = 'America/Los_Angeles';
	userToCreate.LocaleSidKey = 'en_US';
	userToCreate.EmailEncodingKey ='UTF-8';
	userToCreate.LanguageLocaleKey ='en_US';
	
	insert userToCreate;
    }
}