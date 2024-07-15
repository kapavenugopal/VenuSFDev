public class OlderAccountUtility {
    public static void updateOlderAccount(){
        //Get the 5 oldest accounts
        Account[] oldAccounts = [SELECT Id, description from Account ORDER BY createddate ASC LIMIT 5];
        //loop through them and update the description field for the records.
        for(Account acct : oldAccounts){
            acct.Description = 'Heritage Account';
        }
       //Save the changes 
       Update oldAccounts;	
    }

}