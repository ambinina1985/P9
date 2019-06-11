/*
----------------------------------------------------------------------
-- - Author        : AAN
-- - Description   : Trigger on Order AfterUpdate
--                   Update the CA when ordered is "Ordered"
--                   
--                   
--                           
-- Maintenance History:
--
-- Date         Name  Version  Remarks 
-- -----------  ----  -------  ---------------------------------------
-- 04-JUN-2019  AAN    1.0      Version Initial
----------------------------------------------------------------------
*/   
trigger OrderAfterUpdate on Order (after update) {
    
    set<Id> setAccountIds = new set<Id>();
    
    for(Order o: trigger.new){
        if( o.status!= trigger.oldmap.get(o.Id).status && o.status=='Ordered'){
            setAccountIds.add(o.AccountId);
        }
       
    }
    
    if(setAccountIds.size()>0){
        system.debug('#### OderAfterUpdate ####'+ setAccountIds.size()+' records.');
        TR001Account.UpdateAccountCA(setAccountIds);
        
    }
}