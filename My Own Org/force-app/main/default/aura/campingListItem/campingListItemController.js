({
	clickCreateItem : function(component, event, helper) {
		
        var validExpense = component.find('campingdatavalidate').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            console.log("Value: "+ inputCmp.get('v.validity').valid);
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        
        if(validExpense){
           	var newCampingItem = JSON.parse(JSON.stringify(component.get("v.newItem")));
            var campingitems = JSON.parse(JSON.stringify(component.get("v.items")));
            campingitems.push(newCampingItem);
            component.set("v.items", campingitems);
            var all_items = JSON.parse(JSON.stringify(component.get("v.items")));
           	
            if(all_items.length > 0){
                component.find('notifLib').showToast({
                    "title": "Success!",
                    "message": "The record has been updated successfully."
                });
            }
            
        }
        
        
	}
})