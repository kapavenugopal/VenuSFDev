@isTest
public class AccountManagerTest {
	@isTest
    static void test(){
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;
        
        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = 'Last';
        con.AccountId = acc.Id;
        insert con;
        
        RestRequest request = new RestRequest();
        request.requestURI= 'https://AP7.salesforce.com/services/apexrest/Accounts/'+acc.id+'/contacts';
        request.httpMethod= 'GET';
        RestContext.request = request;
        Account accounts = AccountManager.getAccount();
           
    }
}