({
	clickReimbursed: function(component, expense) {
		
		// This is for the server updation        
        /*var action = component.get("c.Saveexpense");
        console.log(component.get("v.expenses"));
        action.setParams({
            "getexpenses": component.get("v.expenses")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                var expenses = component.get("v.expenses");
                console.log(response.getReturnValue());
                //expenses.push(response.getReturnValue());
                component.set("v.Expense", expenses);
            }
        });
        $A.enqueueAction(action);*/
        // =================================
        console.log(component.get("v.expenses"));
        var expense = component.get("v.expenses");
        var updateEvent = component.getEvent("updateExpense");
        
    }
})