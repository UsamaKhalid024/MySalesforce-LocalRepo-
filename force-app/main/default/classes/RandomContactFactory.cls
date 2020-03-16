public class RandomContactFactory {
	public static List<Contact> generateRandomContacts(Integer num_of_contact, String client_last_name){
        
        List<Contact> contact_list = new List<Contact>();
        
        for(Integer conts = 0; conts < num_of_contact; conts++){
			Contact generate_contact = new Contact(
                FirstName = 'Test '+conts,
                LastName = client_last_name
            );
            contact_list.add(generate_contact);
        }
        //Insert contact_list;
        return contact_list;
    }
}