public with sharing class User_t extends DomainBuilder {

	private static final Id STANDARD_USER = [SELECT Id FROM Profile WHERE Name='Standard User'].Id;
	private static final Id SYS_ADMIN_USER  = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id;

	public User_t() {
		super(User.SObjectType);

		String name = new Random().string();
		set(User.Alias, 'alias');
		set(User.Email, name + '@capgemini.com');
		set(User.EmailEncodingKey, 'UTF-8');
		set(User.FirstName, 'Salesforce');
		set(User.Lastname, 'Capgemini');
		set(User.languagelocalekey, 'en_US');
		set(User.localesidkey, 'en_US');
		set(User.timezonesidkey, 'America/Los_Angeles');
		set(User.isActive, true);
		set(User.username, name + '@capgemini.com');
		set(User.profileId, STANDARD_USER);
		set(User.UserPermissionsSFContentUser, false);
	}


	public static User standard() {
		return (User) new User_t()
							.set(User.profileId, STANDARD_USER)
							.persist();
	}

	public static User sysAdmin() {
		return (User) new User_t()
							.set(User.profileId, SYS_ADMIN_USER)
							.persist();
	}
}