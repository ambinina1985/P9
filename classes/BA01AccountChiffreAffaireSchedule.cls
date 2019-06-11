global class BA01AccountChiffreAffaireSchedule implements Schedulable{
   
   public BA01AccountChiffreAffaireSchedule(){
   }
   
   global void execute(SchedulableContext sc) { 
     BA01AccountChiffreAffaire cont = new BA01AccountChiffreAffaire ();       
     Database.executeBatch(cont,200);
   }
}
