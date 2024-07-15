trigger RestrictContactByName on Contact (before insert, before update) {
	//check contact name prior to insert and update.
    for(contact c : Trigger.New){
        if(c.lastname == 'INVALIDNAME'){
            c.AddError('The last name "'+c.lastname+'" is not allowed for DML');
        }
        
    }
}