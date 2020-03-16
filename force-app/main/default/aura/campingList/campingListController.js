({
    doinit: function(component, event, helper){
        var action = component.get("c.getItems");
        $A.enqueueAction(action);
        action.setCallback(this, function(response){
           console.log(response.getReturnValue());
            if(response.getState() === "SUCCESS"){
                component.set("v.items", response.getReturnValue());
                //console.log(component.get("v.items")[0].Name);
            }
        });
    },
    
	saveItemAction : function(component, event, helper) {
        helper.createItem(component);
	}
})