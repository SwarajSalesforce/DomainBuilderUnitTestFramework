@IsTest
public class Task_t extends DomainBuilder {

    public Task_t() {
        super(Task.SObjectType);
        // Populate Required Fields HERE
        subject('Test Subject');
        priority('Normal');
        status('Open');
    }

     // Test Method HERE, Use Snippet - testbuilderMethod
    public Task_t name(Contact_t c) {
        return (Task_t) set(Task.WhoId, c.Id);
    }
    public Task_t relatedTo(Account_t account){
        return (Task_t) set(Task.WhatId, account.Id);
    }
    public Task_t subject(string value){
        return (Task_t) set(Task.Subject, value);
    }
    public Task_t priority(string value){
        return (Task_t) set(Task.Priority, value);
    }
    public Task_t status(string value){
        return (Task_t) set(Task.Status, value);
    }
        
}
