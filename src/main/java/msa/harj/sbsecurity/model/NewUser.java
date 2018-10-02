package msa.harj.sbsecurity.model;

import msa.harj.sbsecurity.utils.EncrytedPasswordUtils;

public class NewUser {

	private String username;
	private String password;
	private String password2;
	private String userrole;
	private String encrytedPassword;

	public NewUser() {

	}

	public NewUser(String username, String password, String userrole) {
		this.username = username;
		this.password = password;
		this.userrole = userrole;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserrole() {
		return userrole;
	}

	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}

	public boolean isPasswordOk() {
		System.out.println("MSA DEBUG newUser.isPasswordOk()");
		if ((this.password == null) || (this.password2 == null)) {
			return false;
		}
		System.out.println(this.password);
		System.out.println(this.password2);
		return this.password.equals(this.password2);
	}

	public boolean encrytePassword() {
		System.out.println("MSA DEBUG newUser.encrytePassword");
		if (isPasswordOk()) {
			this.encrytedPassword = EncrytedPasswordUtils.encrytePassword(this.password);
			this.password = "0";
			this.password2 = "1";
			System.out.println("MSA DEBUG: Password encryted for user "+this.username+" / "+this.encrytedPassword);
			return true;
		}
		return false;
	}

	@Override
	public String toString() {
		return this.username + "/" + this.password+ "(" + this.userrole + ")";
	}

	public String getEncrytedPassword() {
		return encrytedPassword;
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

	public void setEncrytedPassword(String encrytedPassword) {
		this.encrytedPassword = encrytedPassword;
	}

}
