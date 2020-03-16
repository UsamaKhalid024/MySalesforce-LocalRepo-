public class AccountHandler {
	
    public static void insertNewAccount(String Account_Name){
        
        try{
            Account acc = new Account(Name = Account_Name);
            Insert acc;
            //return acc;
        } catch (Exception e){
			system.debug(e.getMessage());
        }
    }
    
}