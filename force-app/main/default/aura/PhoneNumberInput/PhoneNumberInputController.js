({
	send : function(component, event, helper) {
        var text = event.source.get("v.lable");
        $A.get("e.c:PhoneNumberEvent").setParams({
            phone: phone
       }).fire();
    }
})