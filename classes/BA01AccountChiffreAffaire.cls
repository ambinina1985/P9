global with sharing class BA01AccountChiffreAffaire implements Database.Batchable<sObject>,  Database.Stateful  {

    String Query;

    global BA01AccountChiffreAffaire (){
        
            query = 'Select id,chiffre_d_affaire__c, (select totalamount from orders where status =\'Ordered\') from account';                
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(Query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope){
        for( Account a:scope){
            a.chiffre_d_affaire__c=0;
            for (Order o:a.orders){
                a.chiffre_d_affaire__c+= o.totalamount;
            }
        }
        update scope;
    }
    
   
    
    global void finish(Database.BatchableContext BC){
        
    }
    
   

}