package msa.harj.score.model;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import msa.harj.score.utils.EncrytedPasswordUtils;

public class UusiKayttaja {
	private static final Log log = LogFactory.getLog(UusiKayttaja.class);

	private String username;
	private String password;
	private String password2;
	private String userrole;
	private String encrytedPassword;
	private long seuraId;
	private long jasennumero;
	private String etunimi;
	private String sukunimi;

	private Long tasoitus;
	private boolean tasoitus_voimassa;
	private Integer jasen_tyyppi;
	private Integer sukup;

	public UusiKayttaja() {
		this.username = "uk1";
		this.password = "";
		this.userrole = "3";
		this.seuraId = 0L;
		this.jasennumero = 0L;
		this.tasoitus = 54L;
		this.tasoitus_voimassa = true;
		this.jasen_tyyppi = 3;
		this.sukup = 1;
	}

	public UusiKayttaja(String username, String password) {
		this.username = username;
		this.password = password;
		this.userrole = "3";
		this.seuraId = 0L;
		this.jasennumero = 0L;
		this.tasoitus = 54L;
		this.tasoitus_voimassa = true;
		this.jasen_tyyppi = 3;
		this.sukup = 1;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserrole() {
		return this.userrole;
	}

	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}

	public boolean isPasswordOk() {
		log.info("MSA: newUser.isPasswordOk()");
		if ((this.password == null) || (this.password2 == null)) {
			return false;
		}
		return this.password.equals(this.password2);
	}

	public boolean encrytePassword() {
		log.info("MSA: newUser.encrytePassword");
		if (isPasswordOk()) {
			this.encrytedPassword = EncrytedPasswordUtils.encrytePassword(this.password);
			this.password = "0";
			this.password2 = "1";
			log.info("MSA: Password encryted for user " + this.username + " / " + this.encrytedPassword);
			return true;
		}
		return false;
	}

	@Override
	public String toString() {
		return this.username + "(" + this.userrole + ")";
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

	public String getSeuraId() {
		return String.valueOf(this.seuraId);
	}

	public Long getSeuraIdL() {
		return this.seuraId;
	}

	public Long getJasennumero() {
		return (this.jasennumero);
	}

	public void setSeuraId(long seuraId) {
		this.seuraId = seuraId;
	}

	public void setJasennumero(long jasennumero) {
		this.jasennumero = jasennumero;
	}

	public Object getEtunimi() {
		return this.etunimi;
	}

	public String getSukunimi() {
		return this.sukunimi;
	}

	public void setSukunimi(String sukunimi) {
		this.sukunimi = sukunimi;
	}

	public void setEtunimi(String etunimi) {
		this.etunimi = etunimi;
	}

	public Long getTasoitus() {
		return tasoitus;
	}

	public void setTasoitus(Long tasoitus) {
		this.tasoitus = tasoitus;
	}

	public boolean isTasoitus_voimassa() {
		return tasoitus_voimassa;
	}

	public void setTasoitus_voimassa(boolean tasoitus_voimassa) {
		this.tasoitus_voimassa = tasoitus_voimassa;
	}

	public Integer getJasen_tyyppi() {
		return jasen_tyyppi;
	}

	public void setJasen_tyyppi(Integer jasen_tyyppi) {
		this.jasen_tyyppi = jasen_tyyppi;
	}

	public Integer getSukup() {
		return sukup;
	}

	public void setSukup(Integer sukup) {
		this.sukup = sukup;
	}
}
