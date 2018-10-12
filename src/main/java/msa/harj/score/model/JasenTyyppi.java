package msa.harj.score.model;

public class JasenTyyppi {
	private Long id;
	private String tyyppi;
	private String kuvaus;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTyyppi() {
		return tyyppi;
	}

	public void setTyyppi(String tyyppi) {
		this.tyyppi = tyyppi;
	}

	public String getKuvaus() {
		return kuvaus;
	}

	public void setKuvaus(String kuvaus) {
		this.kuvaus = kuvaus;
	}

	public JasenTyyppi(Long id, String tyyppi, String kuvaus) {
		super();
		this.id = id;
		this.tyyppi = tyyppi;
		this.kuvaus = kuvaus;
	}

	@Override
	public String toString() {
		return this.id + " " + this.tyyppi + " " + this.kuvaus;
	}

}
