trigger LoanTrigger on Loan__c (
    before insert,
    before update,
    before delete,
    after insert,
    after update   
) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            LoanTriggerHandler lth = new LoanTriggerHandler();
            lth.calculateExposureBefore(Trigger.oldMap, Trigger.New);
            
      
        }
    }else if (Trigger.isAfter) {
        if (Trigger.isUpdate) {
             	LoanTriggerHandler lth = new LoanTriggerHandler();
      			lth.calculateExposureAfter(Trigger.oldMap, Trigger.New);
            
        }
    }
}