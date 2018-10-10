package msa.harj.score.model;

public class Kayttaja {

	protected Long userId;
	protected String username;
	protected String encrytedPassword;
	protected Long seuraId;
	protected Long jasennumero;
	protected Boolean enabled;
	protected String etunimi;
	protected String sukunimi;

	public String getKokoNimi() {
		return this.etunimi +" "+this.sukunimi;
	}

	public String getEtunimi() {
		return this.etunimi;
	}

	public void setEtunimi(String etunimi) {
		this.etunimi = etunimi;
	}

	public String getSukunimi() {
		return sukunimi;
	}

	public void setSukunimi(String sukunimi) {
		this.sukunimi = sukunimi;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Long getSeuraId() {
		return seuraId;
	}

	public void setSeuraId(Long seuraId) {
		this.seuraId = seuraId;
	}

	public Long getJasennumero() {
		return jasennumero;
	}

	public void setJasennumero(Long jasennumero) {
		this.jasennumero = jasennumero;
	}

	public Kayttaja() {

	}

	public Kayttaja(String username, String encrytedPassword) {
		// this.userId = -1;
		this.username = username;
		this.encrytedPassword = encrytedPassword;
	}

	public Kayttaja(String username, Long seuraId, Long jasennumero) {
		// this.userId = -1;
		this.username = username;
		this.encrytedPassword = "";
		this.jasennumero = jasennumero;
		this.seuraId = seuraId;
		this.enabled = true;
	}

	public Kayttaja(Long userId, String username, /* String encrytedPassword, */ 
			Long seuraId, Long jasennumero,
			Boolean enabled, String etunimi, String sukunimi) {
		super();
		this.userId = userId;
		this.username = username;
		// this.encrytedPassword = encrytedPassword;
		this.seuraId = seuraId;
		this.jasennumero = jasennumero;
		this.enabled = enabled;
		this.etunimi = etunimi;
		this.sukunimi = sukunimi;
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
		return this.etunimi + " " + this.sukunimi + ":" + this.username + "/" + this.encrytedPassword;
	}

}
