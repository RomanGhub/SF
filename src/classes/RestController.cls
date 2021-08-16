
@RestResource(UrlMapping='/AccountManagement/*')
global with sharing class RestController {
    @HttpGet
    global static Account DoGet(){ //List<Account>
   /*     List<Account> lst;
        try {
            lst = [SELECT Id, Name FROM Account];
            return lst;
        } catch (Exception ex){
            System.debug('GET Error' + ex.getMessage());
        }
        return lst;*/
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return result;
    }
    /*RestRequest  req=RestContext.request;
    RestResponse res=RestContext.response;
    String accountid=req.requestURI.substring(req.requestURI.lastIndexof('/')+1);
    System.debug('Account I:'+ accountID);
    Account result=[Select name,phone from Account where ID=:accountID];
    return result;*/

    @HttpPost
    global static Id doPost(String name, String phone, String website) {
        Account account = new Account();
        account.Name = name;
        account.Phone = phone;
        account.Website = website;
        insert account;
        return account.Id;
    }

    @HttpDelete
    global static String DoDelete(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];
        delete account;
        return 'Success!';
    }

    @HttpPut
    global static Account DoUpsert(String Name, Integer AnnualRevenue){
        Map<String,String> paramsMap = RestContext.request.params;
        String accid = paramsMap.get('id');
        Account acc= new Account(Name = Name, AnnualRevenue = AnnualRevenue, Id = accid);
        update acc;
        return acc;
    }

    @HttpPatch
    global static Account DoPatch(){
        RestRequest request = RestContext.request;
        String AccountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Account thisAcc = [SELECT Id FROM Account WHERE Id = :AccountId];
        // Deserialize the JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestBody.toString());
        // Iterate through each parameter field and value
        // Set the field and value on the Case sObject
        for(String fieldName : params.keySet()) {
            thisAcc.put(fieldName, params.get(fieldName));
        }
        update thisAcc;
        return thisAcc;
    }
}