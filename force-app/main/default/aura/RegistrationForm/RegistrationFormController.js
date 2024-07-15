({
	getInput : function(cmp, event) {
      var FirstName = cmp.find("name").get("v.value");
     var FirstName = cmp.find("name1").get("v.value1");
        var FirstName = cmp.find("name2").get("v.value2");
        var FirstName = cmp.find("name3").get("v.value3");
     
        outName.set("v.value", FirstName);
        outName.set("v.value1", LastName);
        outName.set("v.value2", Salutation);
        outName.set("v.value3", PhoneNumber);
    }
})