public class AccountProcessor{
    
    @future
    public static void countContacts(Set<Id> setId){
        List<Account> acc = [SELECT ID, Number_of_Contacts__c, (SELECT ID FROM Contacts) FROM Account WHERE ID IN: setID];
        for(Account a : acc){
            List<Contact> con = a.Contacts;
            a.Number_of_Contacts__c = con.Size();
        }
        update acc;
    }
}