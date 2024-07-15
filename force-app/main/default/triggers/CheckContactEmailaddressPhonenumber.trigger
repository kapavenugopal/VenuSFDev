trigger CheckContactEmailaddressPhonenumber on Opportunity( before update ){

    List<OpportunityContactRole> contactRoles = [SELECT OpportunityId,ContactId, role FROM OpportunityContactRole WHERE OpportunityId IN :Trigger.new];
    Opportunity opportunities = [SELECT Id, StageName FROM Opportunity WHERE Id IN :Trigger.new];
    
    if(contactRoles.size()>0 && contactRoles.isEmpty() && opportunities.StageName=='Qualification'){
        Map<Id,Id> oppCon_map = new Map<Id,Id>();
        for(OpportunityContactRole cr : contactRoles){
        oppCon_map.put(cr.OpportunityId,cr.ContactId);
        }

    Map<Id,Contact> con_map = new Map<ID,Contact>([SELECT Id,Email,Phone FROM Contact WHERE Id IN :oppCon_map.values()]);

        for(Opportunity o :trigger.new){
            if(oppCon_map.containsKey(o.Id)){
                 if(con_map.get(oppCon_map.get(o.id)).Email == '' || con_map.get(oppCon_map.get(o.id)).Phone == ''){
                      o.addError(Label.Contact_role_has_no_email);
                 }
            }
        }
    }
}