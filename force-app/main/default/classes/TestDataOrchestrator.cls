public class TestDataOrchestrator {
    public DefaultDataSet testDataSet {get; set;}
    public TestDataOrchestrator() {
        testDataSet = new DefaultDataSet();
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
        testDataSet.testOpportunity = (Opportunity)new Opportunity_t(new Account_t()
                                                                        .name('For Oppty'))
                                            .name('Opp2')
                                            .amount(5000)
                                        .persist();

        return testDataSet;
    }

    public class DefaultDataSet{
        public Account testAccount { get; set; }
        public Contact testContact { get; set; }
        public Opportunity testOpportunity { get; set; }
    }

}
