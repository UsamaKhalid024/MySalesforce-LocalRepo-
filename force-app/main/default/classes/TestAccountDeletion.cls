@isTest
public class TestAccountDeletion {
		@isTest static void TestDeleteAccountWithOneOpportunity() {
            
            	// Test data setup
        		// Create one account with one opportunity by calling a utility method
        		Account[] accts = TestDataFactory.createAccountsWithOpps(6,1);
            
            // Perform test
            Test.startTest();
            Database.DeleteResult result = Database.delete(accts[0], false);
            Test.stopTest();
           
            //System.assert(!result.isSuccess());
        	//System.assert(result.getErrors().size() > 0);
            //System.assertEquals('Cannot delete account with related opportunities.',
                                 //result.getErrors()[0].getMessage());
        }
    
}