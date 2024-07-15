public class ContactSearch {
    public static List<Contact> searchForContacts(string lastname, string mailingPostalCode){
        List<Contact> myReqContacts = [select Id, Name from contact where (lastname = : lastname AND MailingPostalCode = :mailingPostalCode)];
        return myReqContacts;
    }

}