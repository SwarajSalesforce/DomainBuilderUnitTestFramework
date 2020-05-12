@IsTest
public class Lead_t extends DomainBuilder {

    public Lead_t() {
        super(Lead.SObjectType);
        // Populate Required Fields HERE
        first('Salesforce COE');
        last('Australia');
        company('Capgemini');
        leadSource('Web');
        email('test@capgemini.com');
    }

     // Test Method HERE, Use Snippet - testbuilderMethod
    public Lead_t first(String value) {
        return (Lead_t) set(Lead.FirstName, value);
    }
    public Lead_t last(string value){
        return (Lead_t) set(Lead.LastName, value);
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
