@isTest
public class AccountProcessorTest {
    @isTest
    static void testAccountProcessor(){
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;
        
        Contact con = new Contact();
        con.Lastname = 'Test Contact';
        con.AccountId = acc.Id;
        insert con;
        
        Set<ID> accIdSet = new Set<ID>();
        accIdSet.add(acc.ID);
        
        Test.startTest();
        AccountProcessor.countContacts(accIdSet);
        Test.stopTest();
        
        Account updatedAcc = [SELECT Number_of_Contacts__c FROM Account WHERE ID = :acc.ID LIMIT 1];
        system.assertEquals(updatedAcc.Number_of_Contacts__c, 1);
    }

}