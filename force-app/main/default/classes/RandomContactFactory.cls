Public class RandomContactFactory{
	Public static List<Contact> generateRandomContacts(Integer numConts, String lstName){
		List<Contact> cnts = new List<Contact>();
		for(Integer i = 0; i < numConts; i++){
			Contact c = new Contact(Firstname = 'Test'+i, Lastname = lstName);
			cnts.add(c);
		}
        return cnts;
	}
}