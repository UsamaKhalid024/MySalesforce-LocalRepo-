@RestResource(urlMapping='/getAcc/*')
global with sharing class RestClass {
	@HttpPost
    global static Account getAcc(){
        return [SELECT id, Name from Account];
    }
}