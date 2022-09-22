public  class Loanlist {
    public Id RecordId {get;set;}  
  
    private final Account account;
        public Loanlist() {
        RecordId  = ApexPages.currentPage().getParameters().get('id'); 
        account = [SELECT Id, Name,Total_Direct__c,Total_Indirect__c,Total_Exposure__c,Total_Liability__c,Book_Direct__c,Book_Indirect__c,Ongoing_Direct__c,Ongoing_Indirect__c FROM Account 
                   WHERE Id = :RecordId];
    }

    public Account getAccount() {
        return account;
    }  
    public Boolean IsBorrower = false;
    public Boolean IsGurantor = false;
    public List<Loan__c> getLoanList() {
    
     List<Loan__c> loan = Database.query(
        'SELECT Id, Name, Account__c, Loan_Amount__c, Product__c, Stage__c, Exposure_Amount__c, Borrower_Type__c,Type__c ' +
        'FROM Loan__c ' + 
        'Where Account__c = :RecordId '    
    );

             return loan;
  }  
}