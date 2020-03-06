public class TestingClass {
	
    private Opportunity oppty = new Opportunity();
    public TestingClass(){
        oppty.Id = '0062v00001H3rk8';
    }
    
    public static void MyMethod(String OppId){
        TestingClass tuck = new TestingClass();
        tuck.oppty.Id = OppId;
        tuck.generateopp();
    }
    
    public void generateopp(){
        list<Attachment> opp = [SELECT Id, ParentId, Name, BodyLength, Body, Description FROM Attachment where ParentId =:oppty.id];
    	system.debug(opp);
    }
    
}