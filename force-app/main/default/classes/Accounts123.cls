public with sharing class Accounts123 {

     public SelectOption[] selectedAccounts { get; set; }
     public SelectOption[] allAccounts { get; set; }
      
      public Accounts123 () {
        selectedAccounts = new List<SelectOption>();
        List<Account> accounts = [SELECT Id, Name FROM Account];    
        allAccounts = new List<SelectOption>();
        for ( Account c : accounts ) {
            allAccounts.add(new SelectOption(c.Id, c.Name));
        }
      }
}