({
	onSelectChange : function(component, event, helper) {
    	var selected = component.find("levels");
        component.set("v.whom", selected.get("v.value"));
    //do something else
}
})