public class Account_Shipping_Checker {
    public static void get_regions(){
        // this is the list of regions in which tax is allow....
		List<Shipping_Tax_Regions__mdt> reagions =  [SELECT DeveloperName from Shipping_Tax_Regions__mdt];
        // !------------------- END -------------------!

    }
}