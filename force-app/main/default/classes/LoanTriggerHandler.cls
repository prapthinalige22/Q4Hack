public class LoanTriggerHandler {
    
    public void calculateExposureBefore(Map<Id,Loan__c> oldMap, List<Loan__c> loans){
        	
        System.debug(' hello calculateExposureBefore   ');
        ExpsoureRequest request = new ExpsoureRequest();
        for(Loan__c ln : loans){
            request.loanAmount = ln.Loan_Amount__c;
            request.interestRate = ln.Interest_Rate__c;
            request.borrowerType = ln.Borrower_Type__c;
            request.paymentFrequency = ln.Payment_Frequency__c;
            request.paymentType = ln.Payment_Type__c;
            request.borrower = ln.Account__c;
        }
        
        String strJSON = JSON.serialize(request,true);
        System.debug(' hello calculateExposureBefore   '+strJSON);
    }
    
     public void calculateExposureAfter(Map<Id,Loan__c> oldMap, List<Loan__c> loans){
         
         
        System.debug(' hello calculateExposureAfter   ');
         ExpsoureRequest request = new ExpsoureRequest();
        for(Loan__c ln : loans){
            request.loanAmount = ln.Loan_Amount__c;
            request.interestRate = ln.Interest_Rate__c;
            request.borrowerType = ln.Borrower_Type__c;
            request.paymentFrequency = ln.Payment_Frequency__c;
            request.paymentType = ln.Payment_Type__c;
            request.borrower = ln.Account__c;
        }
        
        String strJSON = JSON.serialize(request,true);
        System.debug(' hello calculateExposureAfter   '+strJSON);
        functions.Function fun =  functions.Function.get('4Hack.my');
         
         functions.FunctionInvocation invocation = fun.invoke(strJSON);
         
        
    }

}