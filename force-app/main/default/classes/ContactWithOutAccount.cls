public class ContactWithOutAccount {
 // ApexPages.StandardSetController must be instantiated
    // for standard list controllers
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Id, FirstName, LastName, AccountId FROM Contact WHERE AccountId = null]));
            }
            return setCon;
        }
        set;
    }

    // Initialize setCon and return a list of records
    public List<Contact> getContacts() {
        return (List<Contact>) setCon.getRecords();
    }

}