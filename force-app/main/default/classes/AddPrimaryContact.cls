public class AddPrimaryContact implements Queueable{
    Private Contact con;
    private String sta;
    public AddPrimaryContact(Contact con, String sta){
        this.con = con;
        this.sta = sta;
    }
    
    public void execute(QueueableContext qc){
        List<Account> reqAccounts = [SELECT Id, BillingState, (SELECT ID, Lastname FROM Contacts) FROM Account WHERE BillingState =:sta LIMIT 200];
        List<Contact> reqConInsert = new List<Contact>();
        for(Account reqAccount : reqAccounts){
            Contact c = con.clone(false,false,false,false);
            c.AccountID = reqAccount.Id;
            reqConInsert.add(c);
                
         }
        if(!reqConInsert.isEmpty()){
            insert reqConInsert;
        }
        }
}