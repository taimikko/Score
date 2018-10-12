package msa.harj.score.model;

public class Rooli {
	private Long id;
	private String nimi;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNimi() {
		return nimi;
	}

	public void setNimi(String nimi) {
		this.nimi = nimi;
	}

	public Rooli(Long id, String nimi) {
		super();
		this.id = id;
		this.nimi = nimi;
	}

	@Override
	public String toString() {
		return this.id + " " + this.nimi;
	}

}
