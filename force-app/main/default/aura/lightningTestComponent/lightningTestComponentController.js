({
  recordUpdated : function(component, event, helper) {

    var changeType = event.getParams().changeType;

    if (changeType === "ERROR") { /* handle error; do this first! */ }
    else if (changeType === "LOADED") { /* handle record load */ }
    else if (changeType === "REMOVED") { /* handle record removal */ }
    else if (changeType === "CHANGED") { 
      /* handle record change; reloadRecord will cause you to lose your current record, including any changes you’ve made */ 
      component.find("forceRecord").reloadRecord();}
    }
})