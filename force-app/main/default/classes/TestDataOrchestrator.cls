public class TestDataOrchestrator {
    public DefaultDataSet testDataSet {get; set;}
    public TestDataOrchestrator() {
        testDataSet = new DefaultDataSet();
    }
    
    //For a single type of entity, this method creates multiple records in a single DML call
    public List<SObject> persistAll(List<DomainBuilder> builders){
        fflib_SObjectUnitOfWork bulkUow = new fflib_SObjectUnitOfWork(
            new List<SObjectType> { builders[0].type } );
        for (DomainBuilder builder : builders) {
            if(builder.record.Id == null) {
                bulkUow.registerNew(builder.record);
            }
        }
        bulkUow.commitWork();

        List<SObject> recordList = new List<SObject>();
        for (DomainBuilder builder : builders) {
            recordList.add(builder.record);
        }
        return recordList;
    }


    public DefaultDataSet createDefaultDataSet(){
        testDataSet.testAccount = (Account)new Account_t()
                                        .name('Salesforce COE')
                                        .shippingState('NSW')
                                        .add(new Opportunity_t())
                                        .add(new Contact_t())
                                        .add(new Case_t())
                                    .persist();
        testDataSet.testContact = (Contact)new Contact_t(new Account_t())
                                        .first('Alex')
                                    .persist();
        testDataSet.testLead = (Lead) new Lead_t().persist();
        testDataSet.testOpportunity = (Opportunity)new Opportunity_t(
                                                        new Account_t()
                                                            .name('For Oppty'))
                                            .name('Opp2')
                                            .amount(5000)
                                        .persist();
        testDataSet.testCase = (Case) new Case_t()
                                        .subject('COE Feedback')
                                        .origin('Web')
                                        .personContact(testDataSet.testContact.Id)
                                        .persist();
        testDataSet.testEvent = (Event) new Event_t()
                                            .name(testDataSet.testContact)
                                            .relatedTo(testDataSet.testAccount)
                                            .persist();
        testDataSet.testTask = (Task) new Task_t()
                                            .name(testDataSet.testContact)
                                            .relatedTo(testDataSet.testAccount)
                                            .persist();

        return testDataSet;
    }


    public class DefaultDataSet{
        public Account testAccount { get; set; }
        public Contact testContact { get; set; }
        public Opportunity testOpportunity { get; set; }
        public Case testCase {get; set;}
        public Lead testLead {get; set;}
        public Event testEvent {get; set;}
        public Task testTask {get;set;}
    }

}
