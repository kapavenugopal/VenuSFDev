Public class ContactAndLeadSearch {
	public static List<List<SObject>> searchContactsAndLeads(string lastName){
		List<List<SObject>> searchList = [Find :lastName IN Name fields RETURNING contact(LastName), Lead(LastName)];
		system.debug(searchList);
        return searchList;
	}
}