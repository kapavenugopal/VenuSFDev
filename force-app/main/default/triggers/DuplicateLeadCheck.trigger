trigger DuplicateLeadCheck on Lead (before insert) {
	Set<String> firstName = new Set<String>();
    Set<String> email = new Set<String>();
    //Map<String, String> nmeEmailMap = new Map<String, String>();
    Map<String, String> dbNmeEmailMap = new Map<String, String>();
    Set<String> dbFirstName = new Set<String>();
    //Set<String> dbEmail = new Set<String>();
    
    for(Lead newLead : Trigger.new){
        firstName.add(newLead.FirstName);
        email.add(newLead.Email);
        //nmeEmailMap.put(newLead.FirstName, newLead.Email);
    }
    
    for(Lead newLead : [SELECT ID, FirstName, Email FROM Lead WHERE FirstName IN : firstName OR Email IN : email]){
        dbFirstName.add(newLead.FirstName);
        //dbEmail.add(newLead.Email);
        dbNmeEmailMap.put(newLead.FirstName, newLead.Email);
    }
    
    for(Lead newLead : Trigger.new){
        if(dbFirstName.contains(newLead.FirstName) && dbNmeEmailMap.get(newLead.FirstName) == newLead.Email){
            newLead.addError('This is a duplicate Lead record');
        }
        
        
    }
}