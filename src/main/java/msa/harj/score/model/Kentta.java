package msa.harj.score.model;

public class Kentta {
	private Long id;
	private Long seura_id;
	private String kentan_lyhenne;
	private String kentan_nimi;

	@Override
	public String toString() {
		return "Kentta [id=" + id + ", seura_id=" + seura_id + ", kentan_lyhenne=" + kentan_lyhenne + ", kentan_nimi="
				+ kentan_nimi + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getSeura_id() {
		return seura_id;
	}

	public void setSeura_id(Long seura_id) {
		this.seura_id = seura_id;
	}

	public String getKentan_lyhenne() {
		return kentan_lyhenne;
	}

	public void setKentan_lyhenne(String kentan_lyhenne) {
		this.kentan_lyhenne = kentan_lyhenne;
	}

	public String getKentan_nimi() {
		return kentan_nimi;
	}

	public void setKentan_nimi(String kentan_nimi) {
		this.kentan_nimi = kentan_nimi;
	}

	public Kentta(Long id, Long seura_id, String kentan_lyhenne, String kentan_nimi) {
		super();
		this.id = id;
		this.seura_id = seura_id;
		this.kentan_lyhenne = kentan_lyhenne;
		this.kentan_nimi = kentan_nimi;
	}

}
