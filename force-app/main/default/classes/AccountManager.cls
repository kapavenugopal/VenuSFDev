@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
	@HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        System.debug('Rest request' + request);
         
        //grab the case ID
        String accountId = request.requestURI.subStringBetween('Accounts/','/contacts');
        System.debug('This is the account id from the request' + request.requestURI.subStringBetween('Account/','/Contacts'));
        Account result =  [SELECT ID,Name, (SELECT ID, Name from Contacts)
                        FROM Account
                        WHERE Id = :accountId];
        return result;
    }
}