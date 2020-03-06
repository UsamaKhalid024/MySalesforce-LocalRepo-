({
	createExpense : function(component) {
		var action = component.get("c.getExpenses");
        $A.enqueueAction(action);
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(response.getReturnValue());
            if (state === "SUCCESS") {
                component.set("v.Expense", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
	}
})