trigger AccountDeletion on Account (before delete) {
    // prevent deletion of account if it has related opportunities
    for(Account a : [Select ID from Account 
                     where ID IN(select AccountID from opportunity) AND 
                     ID IN:Trigger.old]){
     	Trigger.oldMap.get(a.ID).addError('Cannot delete account with related opportunities.');                    
                         
     }

}