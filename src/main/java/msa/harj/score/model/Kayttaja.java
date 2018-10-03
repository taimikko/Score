package msa.harj.score.model;

public class Kayttaja {

	private Long userId;
	private String username;
	private String encrytedPassword;

	public Kayttaja() {

	}

	public Kayttaja(Long userId, String username, String encrytedPassword) {
		this.userId = userId;
		this.username = username;
		this.encrytedPassword = encrytedPassword;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getusername() {
		return username;
	}

	public void setusername(String username) {
		this.username = username;
	}

	public String getEncrytedPassword() {
		return encrytedPassword;
	}

	public void setEncrytedPassword(String encrytedPassword) {
		this.encrytedPassword = encrytedPassword;
	}

	@Override
	public String toString() {
		return this.username + "/" + this.encrytedPassword;
	}

}
