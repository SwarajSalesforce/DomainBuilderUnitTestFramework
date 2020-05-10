@IsTest
public class Case_t extends DomainBuilder {

    public Case_t(Account_t acc) {
        super(Case.SObjectType);
        setParent(Case.AccountId, acc);
        setParent(Case.ContactId, new Contact_t(acc));
        //Set Contact in case of Person Account condition
        //personContact(acc.PersonContactId);
        status('New');
        origin('Phone');
    }

    public Case_t() {        
        this(new Account_t());
    }

     // Test Method HERE, Use Snippet - testbuilderMethod
    public Case_t status(String value) {
        return (Case_t) set(Case.Status, value);
    }
    public Case_t origin(string value){
        return (Case_t) set(Case.Origin, value);
    }
    public Case_t personContact(string value){
        return (Case_t) set(Case.ContactId, value);
    }
    
}
    

