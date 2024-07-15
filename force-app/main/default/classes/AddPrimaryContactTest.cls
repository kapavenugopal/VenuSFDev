@isTest
public class AddPrimaryContactTest {
    @isTest
    static void setUp(){
        List<Account> accNa = new List<Account>();
        List<Account> accCa = new List<Account>();  
        for(Integer i=0;i<50;i++){
            accNa.add(new Account(Name = 'Test'+i, BillingState = 'NA'));
        }
        insert accNa;
        for(Integer j=0;j<50;j++){
            accCa.add(new Account(Name = 'TestAcc'+j, BillingState = 'CA'));
        }
        insert accCa;
        Contact con = new Contact(LastName = 'TestContact');
        insert con;
        Test.startTest();
            AddPrimaryContact aPC = new AddPrimaryContact(con, 'CA');
        	//System.enqueueJob(aPC);
            ID jobID = System.enqueueJob(aPC);
        Test.stopTest();
        
        List<Contact> updatedCon = [SELECT ID FROM Contact WHERE AccountID IN :accCa];
        system.assertEquals(50, updatedCon.size());
    }

}