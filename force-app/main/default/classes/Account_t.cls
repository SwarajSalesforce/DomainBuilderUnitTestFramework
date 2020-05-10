@IsTest
public class Account_t extends DomainBuilder {

	public Account_t() {
		super(Account.SObjectType);
		
		name('Acme Corp');
		//recordType('Business');
		withShippingAddress();
		withBillingAddress();
	}

	public Account_t name(String value) {
		return (Account_t) set(Account.Name, value);
	}

	//Add Shipping Address
	public Account_t withShippingAddress(){
		return this.shippingStreet('565 Collins Street')
					.shippingCity('Melbourne')
					.shippingState('Victoria')
					.shippingPostalCode('3000')
					.shippingCountry('Australia');
	}

	public Account_t shippingStreet(string value){
		return (Account_t) set(Account.ShippingStreet, value);
	}

	public Account_t shippingCity(string value){
		return (Account_t) set(Account.ShippingCity, value);
	}
	
	public Account_t shippingState(string value){
		return (Account_t) set(Account.ShippingState, value);
	}
	public Account_t shippingPostalCode(string value){
		return (Account_t) set(Account.ShippingPostalCode, value);
	}
	public Account_t shippingCountry(string value){
		return (Account_t) set(Account.ShippingCountry, value);
	}

	//Add Billing Address
	public Account_t withBillingAddress(){
		return this.billingStreet('560 spencer street')
					.billingCity('Melbourne')
					.billingState('Victoria')
					.billingPostalCode('3000')
					.billingCountry('Australia');
	}

	public Account_t billingStreet(string value){
		return (Account_t) set(Account.BillingStreet, value);
	}

	public Account_t billingCity(string value){
		return (Account_t) set(Account.BillingCity, value);
	}
	
	public Account_t billingState(string value){
		return (Account_t) set(Account.BillingState, value);
	}
	public Account_t billingPostalCode(string value){
		return (Account_t) set(Account.BillingPostalCode, value);
	}
	public Account_t billingCountry(string value){
		return (Account_t) set(Account.BillingCountry, value);
	}

	//Relationship
	public Account_t add(Opportunity_t opp) {
		return (Account_t) opp.setParent(Opportunity.AccountId, this);
	}

	public Account_t add(Contact_t con) {
		return (Account_t) con.setParent(Contact.AccountId, this);
	}

	public Account_t add(Case_t caseTest) {
		return (Account_t) caseTest.setParent(Case.AccountId, this);
	}
}