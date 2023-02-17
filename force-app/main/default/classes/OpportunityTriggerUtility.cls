public class OpportunityTriggerUtility {

    Public static List<OpportunityWrapper> sortbyAmount(List<Opportunity> oppList){
        List<OpportunityWrapper> oppyList = new List<OpportunityWrapper>();
          for(Opportunity opp:oppList){
             oppyList.add( new OpportunityWrapper(opp,true));
               
          }
          oppyList.sort();
          return oppyList;
    }
    
    
     Public static List<OpportunityWrapper> sortbyCloseDate(List<Opportunity> oppList){
        List<OpportunityWrapper> oppyList = new List<OpportunityWrapper>();
          for(Opportunity opp:oppList){
                oppyList.add( new OpportunityWrapper(opp,true));
          }
          oppyList.sort();
          return oppyList;
    }
    
    Public static Double averageAmount(List<Opportunity> oppList ){
          Double amount =0;
         for(Opportunity opp:oppList){
          
               amount=opp.Amount;
          }
         return amount/oppList.size();
    }
}