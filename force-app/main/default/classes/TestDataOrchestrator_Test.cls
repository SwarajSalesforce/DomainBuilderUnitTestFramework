@IsTest
private class TestDataOrchestrator_Test {
    
    @IsTest
    private static void testDefaultDataSet(){
        TestDataOrchestrator.DefaultDataSet defaultData = new TestDataOrchestrator().createDefaultDataSet();

        System.assertEquals('Salesforce COE', [SELECT Name FROM Account where ShippingState = 'NSW'][0].Name, 'Matched Account');
        //System.assertEquals(1, [SELECT Count() FROM Opportunity]);
        //System.assertEquals(2, [SELECT Count() FROM Contact]);
        //System.assertEquals(1, [SELECT Count() FROM OpportunityContactRole]);
    }
}
