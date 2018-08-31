package org.o7planning.sbsecurity.model;

public class NewUser {

	private String userName;
	private String password;
	private String password2;
	private String userrole;
	//private String encrytedPassword;

	public NewUser() {

	}

	public NewUser(String userName, String password, String userrole) {
		this.userName = userName;
		this.password = password;
		this.userrole = userrole;
	}

	public String getUserName() {
		return userName;
	}

	public boolean passwordOk() {
		return this.password.equals(this.password2);
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getUserrole() {
		return userrole;
	}

	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}

	@Override
	public String toString() {
		return this.userName + "/" + this.password;
	}

}
