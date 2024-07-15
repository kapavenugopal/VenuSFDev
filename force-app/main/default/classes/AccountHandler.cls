public class AccountHandler {
    public static Account insertNewAccount(String name){
		//Insert new account
        Account a = new Account();
        a.name = name;
        
        try{
            insert a;
        }catch(Exception e){
            return null;
        }
        return a;
    }

}