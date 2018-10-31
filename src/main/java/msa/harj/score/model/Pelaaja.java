package msa.harj.score.model;

import java.sql.Timestamp;

// id, pvm, seura_id, jasennumero, sukunimi, etunimi, sukup, jasen_tyyppi, tasoitus, tasoitus_voimassa 

public class Pelaaja extends Kayttaja {
	//private static final Log log = LogFactory.getLog(Pelaaja.class);

//	protected Long kayttajaId;
//	protected String username;
//	protected String encrytedPassword;
//	protected Boolean enabled;
//	protected String etunimi;
//	protected String sukunimi;
//  protected int sukup;
	private Long id;
	private Timestamp pvm;
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

	public Pelaaja(Long kayttaja_id, String kayttajatunnus, boolean enabled, Long id, Long seuraId, Long jasennumero,
			String sukunimi, String etunimi, Integer jasentyyppi, Long tasoitus,
			boolean tasoitus_voimassa, Timestamp pvm) {
		super(kayttajatunnus, "");
		this.kayttajaId = kayttaja_id;
		this.enabled = enabled;
		this.id = id;
		this.seuraId = seuraId;
		this.jasennumero = jasennumero;
		this.sukunimi = sukunimi;
		this.etunimi = etunimi;
		this.jasentyyppi = jasentyyppi; // käyttäjällä
		this.tasoitus = tasoitus;
		this.tasoitus_voimassa = tasoitus_voimassa;
		this.pvm = pvm;
	}
	
	@Override
	public String toString() {
		return "Pelaaja [id=" + id + ", pvm=" + pvm + ", seuraId=" + seuraId + ", jasennumero=" + jasennumero
				+ ", sukunimi=" + sukunimi + ", etunimi=" + etunimi + ", sukup=" + sukup + ", tasoitus=" + tasoitus + ", tasoitus_voimassa=" + tasoitus_voimassa + "]";
	}

	public Pelaaja() {
		super();
	}

	public Pelaaja(String username, Long seuraId, Long jasennumero) {
		super(username, seuraId, jasennumero);
	}

	public Pelaaja(String username, String encrytedPassword) {
		super(username, encrytedPassword);
	}

	public Pelaaja(UusiKayttaja k) {
		super(k.getUsername(), k.getSeuraIdL(), k.getJasennumero());
		this.etunimi = (String)k.getEtunimi();
		this.sukunimi = (String)k.getSukunimi();
		this.sukup = k.getSukup();
		this.jasentyyppi = k.getJasen_tyyppi();
		this.tasoitus = k.getTasoitus();
		this.tasoitus_voimassa = k.isTasoitus_voimassa();
	}

}
