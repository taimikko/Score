package msa.harj.score.model;

import java.sql.Timestamp;

// id, pvm, seura_id, jasennumero, sukunimi, etunimi, sukup, jasen_tyyppi, tasoitus, tasoitus_voimassa 

public class Pelaaja extends Kayttaja{
//	protected Long kayttajaId;
//	protected String username;
//	protected String encrytedPassword;
//	protected Boolean enabled;
//	protected String etunimi;
//	protected String sukunimi;
	private Long id;
	private Timestamp pvm;
	private Long seura_id;
	private Long jasennumero;
	private Integer sukup;
	private Integer jasen_tyyppi;
	private Long tasoitus;
	private boolean tasoitus_voimassa;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Timestamp getPvm() {
		return pvm;
	}
	public void setPvm(Timestamp pvm) {
		this.pvm = pvm;
	}
	public Long getSeura_id() {
		return seura_id;
	}
	public void setSeura_id(Long seura_id) {
		this.seura_id = seura_id;
	}
	public Long getJasennumero() {
		return jasennumero;
	}
	public void setJasennumero(Long jasennumero) {
		this.jasennumero = jasennumero;
	}
	public String getSukunimi() {
		return sukunimi;
	}
	public void setSukunimi(String sukunimi) {
		this.sukunimi = sukunimi;
	}
	public String getEtunimi() {
		return etunimi;
	}
	public void setEtunimi(String etunimi) {
		this.etunimi = etunimi;
	}
	public Integer getSukup() {
		return sukup;
	}
	public void setSukup(Integer sukup) {
		this.sukup = sukup;
	}
	public Integer getJasen_tyyppi() {
		return jasen_tyyppi;
	}
	public void setJasen_tyyppi(Integer jasen_tyyppi) {
		this.jasen_tyyppi = jasen_tyyppi;
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
	
	public Pelaaja(Long kayttaja_id,String kayttajatunnus, boolean enabled, Long id, Long seura_id, Long jasennumero, String sukunimi, String etunimi, Integer sukup,
			Integer jasen_tyyppi, Long tasoitus, boolean tasoitus_voimassa, Timestamp pvm) {
		super(kayttajatunnus, "");
		this.kayttajaId = kayttaja_id;
		this.enabled = enabled;
		this.id = id;
		this.seura_id = seura_id;
		this.jasennumero = jasennumero;
		this.sukunimi = sukunimi;
		this.etunimi = etunimi;
		this.sukup = sukup;
		this.jasen_tyyppi = jasen_tyyppi;
		this.tasoitus = tasoitus;
		this.tasoitus_voimassa = tasoitus_voimassa;
		this.pvm = pvm;
	}
	
	@Override
	public String toString() {
		return "Pelaaja [id=" + id + ", pvm=" + pvm + ", seura_id=" + seura_id + ", jasennumero=" + jasennumero
				+ ", sukunimi=" + sukunimi + ", etunimi=" + etunimi + ", sukup=" + sukup + ", jasen_tyyppi="
				+ jasen_tyyppi + ", tasoitus=" + tasoitus + ", tasoitus_voimassa=" + tasoitus_voimassa + "]";
	}
	
	public Pelaaja() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Pelaaja(String username, Long seuraId, Long jasennumero) {
		super(username, seuraId, jasennumero);
		// TODO Auto-generated constructor stub
	}
	
	public Pelaaja(String username, String encrytedPassword) {
		super(username, encrytedPassword);
		// TODO Auto-generated constructor stub
	}


}
