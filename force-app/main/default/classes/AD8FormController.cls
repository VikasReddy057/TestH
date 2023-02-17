public class AD8FormController {

    public string textvalue {set;get;}
    public string selectedOp {set;get;}
    public string selectedOp1 {set;get;}
    public string selectedOp2 {set;get;}
    public string selectedOp3 {set;get;}
    public string selectedOp4 {set;get;}
    public string selectedOp5 {set;get;}
    public string selectedOp6 {set;get;}
    public string selectedOp7 {set;get;}
    
     public string demo {set;get;}
    
    
    public contact acct;
     public boolean disablevalue {set;get;}
    public String selectedRT{get;set;}
    public boolean pb2Rendered{get;set;} // true -> show pb2
    public boolean pb3Rendered{get;set;}
     public boolean pb4Rendered{get;set;}
     public AD8FormController(ApexPages.StandardController stdController) {
      this.acct = (contact)stdController.getRecord();
         disablevalue = false;
     acct = [select Id,Question__c,AfterSubmit__c,Question6__c,Question7__c,Question1__c,Question2__c,Question3__c,Question4__c,Question5__c from contact where Id=:acct.Id];

         selectedOp= acct.Question__c;
        selectedOp1= acct.Question1__c;
        selectedOp2= acct.Question2__c;
        selectedOp3= acct.Question3__c;
        selectedOp4= acct.Question4__c;
        selectedOp5= acct.Question5__c;
        selectedOp6= acct.Question6__c;
        selectedOp7= acct.Question7__c;
         disablevalue = acct.AfterSubmit__c;
         pb2Rendered=true;
       pb3Rendered = pb4Rendered =false;
        selectedRT='';
     }
    
    
     public pagereference updatecon(){
         
         integer noofY =0;
        integer noofN = 0;
        integer noofNAP=0;
         
         if(selectedOp =='Yes')
            noofY =noofY+1;
        else if(selectedOp=='No')
            noofN =noofN+1;
         else
             noofNAP=noofNAP+1;
         
        if(selectedOp1 =='Yes')
            noofY =noofY+1;
        else if(selectedOp1=='No')
            noofN =noofN+1;
         else
             noofNAP=noofNAP+1;
         
         if(selectedOp2 =='Yes')
            noofY =noofY+1;
        else if(selectedOp2=='No')
            noofN =noofN+1;
         else
             noofNAP=noofNAP+1;
         
         if(selectedOp3 =='Yes')
            noofY =noofY+1;
        else if(selectedOp3=='No')
            noofN =noofN+1;
         else
             noofNAP=noofNAP+1;
         
         if(selectedOp4 =='Yes')
            noofY =noofY+1;
        else if(selectedOp4=='No')
            noofN =noofN+1;
         else
             noofNAP=noofNAP+1;
         
         if(selectedOp5 =='Yes')
            noofY =noofY+1;
        else if(selectedOp5=='No')
            noofN =noofN+1;
         else
             noofNAP=noofNAP+1;
         
         if(selectedOp6 =='Yes')
            noofY =noofY+1;
        else if(selectedOp6=='No')
            noofN =noofN+1;
         else
             noofNAP=noofNAP+1;
         
         if(selectedOp7 =='Yes')
            noofY =noofY+1;
        else if(selectedOp7=='No')
            noofN =noofN+1;
         else
             noofNAP=noofNAP+1;
         
         acct.AD_Total_Yes__c=noofY;
         acct.AD_Total_No__c=noofN;
         acct.AD_Total_NAP__c=noofNAP;
         acct.AfterSubmit__c= true;

        acct.Question__c = selectedOp;
        acct.Question1__c = selectedOp1;
        acct.Question2__c = selectedOp2;
        acct.Question3__c = selectedOp3;
        acct.Question4__c = selectedOp4;
        acct.Question5__c = selectedOp5;
        acct.Question6__c = selectedOp6;
        acct.Question7__c = selectedOp7;
         update acct;
         
         
        acct = [select Id,AfterSubmit__c from contact where Id=:acct.Id];
        disablevalue = acct.AfterSubmit__c;
         
       return null;         
         
       }
    
    
     public void onChangeFnCall(){
            
          if(selectedRT=='abc'){
               
              demo='1';
            pb2Rendered = true;
            pb3Rendered = false;
           pb4Rendered = false;
        }
        else if(selectedRT=='def'){
     
             pb3Rendered = true;
            pb2Rendered = false;
            pb4Rendered = false;
        }
            else if(selectedRT=='ghi'){
                demo='3';
                
            pb2Rendered = false;
            pb3Rendered = false;
            pb4Rendered = true;
        }
            
        else{
             demo='1';
           pb2Rendered = true;
            pb3Rendered = false;
           pb4Rendered = false;
        }
     }
     public void onChangeFnCall1(){
          if(selectedOp=='Yes'){
              selectedOp ='Yes';
               }
          if(selectedOp=='No'){
              selectedOp ='No';
               }
     }
     public void onChangeFnCall2(){
          if(selectedOp1=='Yes'){
              selectedOp1 ='Yes';
               }
          if(selectedOp1=='No'){
              selectedOp1 ='No';
               }
     }
     public void onChangeFnCall3(){
          if(selectedOp2=='Yes'){
              selectedOp2 ='Yes';
               }
          if(selectedOp2=='No'){
              selectedOp2 ='No';
               }
     }
    public void onChangeFnCall4(){
          if(selectedOp3=='Yes'){
              selectedOp3 ='Yes';
               }
          if(selectedOp3=='No'){
              selectedOp3 ='No';
               }
     }
    public void onChangeFnCall5(){
          if(selectedOp4=='Yes'){
              selectedOp4='Yes';
               }
          if(selectedOp4=='No'){
              selectedOp4 ='No';
               }
     }
    public void onChangeFnCall6(){
          if(selectedOp5=='Yes'){
              selectedOp5 ='Yes';
               }
          if(selectedOp5=='No'){
              selectedOp5 ='No';
               }
     }
    public void onChangeFnCall7(){
          if(selectedOp6=='Yes'){
              selectedOp6 ='Yes';
               }
          if(selectedOp6=='No'){
              selectedOp6 ='No';
               }
     }
    public void onChangeFnCall8(){
          if(selectedOp7=='Yes'){
              selectedOp7 ='Yes';
               }
          if(selectedOp7=='No'){
              selectedOp7 ='No';
               }
     }
}