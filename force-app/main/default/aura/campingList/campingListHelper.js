({
	createItem : function(component) {
		console.log("this is helper");
        console.log(component.get("v.items"));
        var action = component.get("c.saveItem");
        action.setParams({
            "campitems": component.get("v.items")
        });
        console.log('this is another test');
        action.setCallback(this, function(response){
          	if(response.getState() === "SUCCESS"){
                var expenses = component.get("v.items");
                expenses.push(response.getReturnValue());
                component.set("v.items", expenses);
            }
		});
        $A.enqueueAction(action);
	}
})