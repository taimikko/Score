package msa.harj.score.model;

public class Kayttaja {
	protected Long kayttajaId;
	protected String username;
	protected String encrytedPassword;
	protected Long seuraId;
	protected Long jasennumero;
	protected Boolean enabled;
	protected String etunimi;
	protected String sukunimi;
	protected Integer sukup;
	protected Integer jasentyyppi;

	public Kayttaja() {
		this.sukup = 3;
	}

	public Kayttaja(String username, String encrytedPassword) {
		this.username = username;
		this.encrytedPassword = encrytedPassword;
	}

	public Kayttaja(String username, Long seuraId, Long jasennumero) {
		this.username = username;
		this.encrytedPassword = "";
		this.jasennumero = jasennumero;
		this.seuraId = seuraId;
		this.enabled = true;
		setSukup(3);
	}

	public Kayttaja(Long kayttajaId, String username, /* String encrytedPassword, */
			Long seuraId, Long jasennumero, Boolean enabled, String etunimi, String sukunimi, Integer sukup, Integer jasentyyppi) {
		super();
		this.kayttajaId = kayttajaId;
		this.username = username;
		// this.encrytedPassword = encrytedPassword;
		this.seuraId = seuraId;
		this.jasennumero = jasennumero;
		this.enabled = enabled;
		this.etunimi = etunimi;
		this.sukunimi = sukunimi;
		setSukup(sukup);
		this.jasentyyppi = jasentyyppi;
	}

	public void setSukup(Integer sukup) {
		if (sukup == null) {
//			log.info("MSA: Sukup== null \t->3");
			sukup = 3; // ei tietoa
		}
		this.sukup = sukup;
	}

	
	public Long getKayttajaId() {
		return kayttajaId;
	}

	public void setKayttajaId(Long kayttajaId) {
		this.kayttajaId = kayttajaId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEncrytedPassword() {
		return encrytedPassword;
	}

	public void setEncrytedPassword(String encrytedPassword) {
		this.encrytedPassword = encrytedPassword;
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

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getEtunimi() {
		return etunimi;
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

	public Integer getJasentyyppi() {
		return jasentyyppi;
	}

	public void setJasentyyppi(Integer jasentyyppi) {
		this.jasentyyppi = jasentyyppi;
	}

	public Integer getSukup() {
		return sukup;
	}

	@Override
	public String toString() {
		return this.kayttajaId + " " + this.etunimi + " " + this.sukunimi + ":" + this.username +" Seura:" + this.seuraId + " jäsennumero:" + this.jasennumero + " enabled:"
				+ this.enabled + " sukup:" + this.sukup + " jäsenyyden tyyppi:" + this.jasentyyppi;
	}
	
	public String getKokoNimi() {
		return this.etunimi+" "+this.sukunimi;
	}

}
