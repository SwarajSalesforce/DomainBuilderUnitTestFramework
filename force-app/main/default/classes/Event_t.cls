@IsTest
public class Event_t extends DomainBuilder {

    public Event_t() {
        super(Event.SObjectType);
        // Populate Required Fields HERE
        description('testDescription');
        starts(system.today().year(), system.today().month());
        ends(system.today().year(), system.today().addDays(10).month());
    }

     // Test Method HERE, Use Snippet - testbuilderMethod
    public Event_t name(Contact c) {
        return (Event_t) set(Event.WhoId, c.Id);
    }
    public Event_t relatedTo(Account account){
        return (Event_t) set(Event.WhatId, account.Id);
    }
    
    public Event_t description(string value){
        return (Event_t) set(Event.Description, value);
    }
    public Event_t starts(integer y, integer m){
        return (Event_t) set(Event.StartDateTime, DateTime.newInstance(y, m, 1));
    }
    public Event_t ends(integer y, integer m){
        return (Event_t) set(Event.EndDateTime, DateTime.newInstance(y, m, 1));
    }
    public Event_t subject(string value){
        return (Event_t) set(Event.Subject, value);
    }
        
}
