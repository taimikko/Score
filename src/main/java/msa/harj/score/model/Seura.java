package msa.harj.score.model;

public class Seura {
	private Long id;
	private String lyhenne;
	private String nimi;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLyhenne() {
		return lyhenne;
	}

	public void setLyhenne(String lyhenne) {
		this.lyhenne = lyhenne;
	}

	public String getNimi() {
		return nimi;
	}

	public void setNimi(String nimi) {
		this.nimi = nimi;
	}

	public Seura(Long id, String lyhenne, String nimi) {
		super();
		this.id = id;
		this.lyhenne = lyhenne;
		this.nimi = nimi;
	}

	@Override
	public String toString() {
		return this.id + " " + this.lyhenne + " " + this.nimi;
	}

}
