package msa.harj.score.model;

public class Kayttaja2 extends Kayttaja {
	private String seura; // seuran nimi
	private String tyyppi; // jäsenyyden tyyppi merkkijonona

	public Kayttaja2() {
		super();
	}

	public Kayttaja2(Long kayttajaId, String username, /* String encrytedPassword, */
			Long seuraId, Long jasennumero, Boolean enabled, String etunimi, String sukunimi, Integer sukup,
			Integer jasentyyppi, String seura, String tyyppi) {
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
		this.seura = seura;
		this.tyyppi = tyyppi;
	}

	public String getSeura() {
		return seura;
	}

	public void setSeura(String seura) {
		this.seura = seura;
	}

	public String getTyyppi() {
		return tyyppi;
	}

	public void setTyyppi(String tyyppi) {
		this.tyyppi = tyyppi;
	}

	@Override
	public String toString() {
		return "Kayttaja2 [seura=" + seura + ", tyyppi=" + tyyppi + ", kayttajaId=" + kayttajaId + ", username="
				+ username + ", encrytedPassword=" + encrytedPassword + ", seuraId=" + seuraId + ", jasennumero="
				+ jasennumero + ", enabled=" + enabled + ", etunimi=" + etunimi + ", sukunimi=" + sukunimi + ", sukup="
				+ sukup + ", jasentyyppi=" + jasentyyppi + "]";
	}

}
