package org.o7planning.sbsecurity.model;

import org.o7planning.sbsecurity.utils.EncrytedPasswordUtils;

public class NewUser {

	private String userName;
	private String password;
	private String password2;
	private String userrole;
	private String encrytedPassword;

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

	public void setUserName(String userName) {
		this.userName = userName;
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
			System.out.println("MSA DEBUG: Password encryted for user "+this.userName+" / "+this.encrytedPassword);
			return true;
		}
		return false;
	}

	@Override
	public String toString() {
		return this.userName + "/" + this.password+ "(" + this.userrole + ")";
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
