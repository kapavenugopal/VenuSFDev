public class ConWithNoAccSelector {

public List<ContactWrap> wrapContactList{get; set;}
public List<Contact> selectedContactList{get; set;}

public ConWithNoAccSelector(){
    if(wrapContactList == null){
        wrapContactList = new List<ContactWrap>();
        for(Contact c : [SELECT ID, Lastname, Firstname, AccountID FROM Contact WHERE AccountId = null]){
            wrapContactList.add(new ContactWrap(c));
        }
    }
}

public void selectedCon(){
selectedContactList = new List<Contact>();
    for(ContactWrap wrapContactListObj : wrapContactList){
        if(wrapContactListObj.selected == True){
            selectedContactList.add(wrapContactListObj.con);
        }
    }
}


public class ContactWrap{
    public Contact con{get; set;}
    public Boolean selected{get; set;}
    
    public ContactWrap(Contact c){
        con = c;
        selected = False;
   
    }
}


}