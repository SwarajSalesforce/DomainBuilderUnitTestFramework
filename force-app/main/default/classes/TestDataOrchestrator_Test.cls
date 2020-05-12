@IsTest
private class TestDataOrchestrator_Test {
    
    @IsTest
    private static void testDefaultDataSet(){
        TestDataOrchestrator.DefaultDataSet defaultData = new TestDataOrchestrator().createDefaultDataSet();

        Account testAccount = (Account)[SELECT Name, BillingCity FROM Account where ShippingState = 'NSW'][0];
        List<Contact> testContacts = [Select FirstName FROM Contact where FirstName = 'Alex'];
        Task testTask = [Select Id, WhatId FROM Task where Subject = 'Test Subject' LIMIT 1];

        System.assertEquals('Salesforce COE', testAccount.Name, 'Matched Account');
        System.assertEquals('Melbourne', testAccount.BillingCity, 'Matched Account Billing');
        System.assertEquals('COE Feedback', [Select Subject FROM Case where Origin ='Web' LIMIT 1].Subject, 'Matched Case');
        System.assert(testContacts.size() == 1, 'Matched contact');
        System.assertEquals(2, [SELECT Count() FROM Opportunity], 'count Oppty');
        System.assertEquals(1, [SELECT Count() FROM Event], 'Count Event');
        System.assertEquals(1, [SELECT Count() FROM Lead], 'Count Lead');
        System.assert(string.isNotempty(testTask.WhatId), 'Account linked with Task');
    }

   @IsTest
    private static void testBulkData(){
        List<Account_t> accounts = new List<Account_t>();
        for (Integer i = 0; i < 10; i++) {
            Account_t acc = new Account_t().name('Test ' + i);
            accounts.add(acc);
        }
        List<Account> accountRecords = new List<Account>();
        List<SObject> objectRecords = new TestDataOrchestrator().persistAll(accounts);
        
        for (SObject record : objectRecords) {
            accountRecords.add((Account)record);
        }
        System.assertEquals(10, accountRecords.size(), 'Check Builder records');
        System.assertEquals(10, [Select Count() FROM Account], 'Check Account from DB');
    }
}
