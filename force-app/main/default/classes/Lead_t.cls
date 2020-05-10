@IsTest
public class Lead_t extends DomainBuilder {

    public Lead_t() {
        super(Lead.SObjectType);
        // Populate Required Fields HERE
        name('Salesforce COE');
        company('Capgemini');
        leadSource('Web');
        email('test@capgemini.com');
    }

     /* -- For auto relation builder
    public Lead_t(RelationshipEntity a) {
        super(Lead.SObjectType);
        setParent(Lead.RelationId, a);
    }
    */

     // Test Method HERE, Use Snippet - testbuilderMethod
    public Lead_t name(String value) {
        return (Lead_t) set(Lead.Name, value);
    }
    public Lead_t company(string value){
        return (Lead_t) set(Lead.Company, value);
    }
    public Lead_t leadSource(string value){
        return (Lead_t) set(Lead.LeadSource, value);
    }
    public Lead_t email(string value){
        return (Lead_t) set(Lead.Email, value);
    }
}
