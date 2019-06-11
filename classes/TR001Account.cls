public with sharing class TR001Account{

/*
----------------------------------------------------------------------
-- - Author        : AAN
-- - Description   : Triggered by OrderAfterUpdate
--                   Calculate the "chiffre d'affaires" of the account
--                   when order status is moved to "Ordered"
--                   
--                           
-- Maintenance History:
--
-- Date         Name  Version  Remarks 
-- -----------  ----  -------  ---------------------------------------
-- 04-JUN-2019  AAN    1.0      Version Initial
----------------------------------------------------------------------
*/  

    public static void UpdateAccountCA(Set<Id> setAccountIds){
       
        AggregateResult[] results = [select accountId, sum(totalamount) from order where AccountId in:setAccountIds and status ='Ordered' group by accountId];
        List<Account> lAccount = new List<Account>();
        decimal CA;
        
        for (AggregateResult ar : results )  {
            CA = (Decimal)(ar.get('expr0'));
            lAccount.add(new Account ( id= (String)(ar.get('accountId')),Chiffre_d_affaire__c=CA));    
        }
        
        if(laccount.size()>0)
            update laccount;
    
    }

    
}