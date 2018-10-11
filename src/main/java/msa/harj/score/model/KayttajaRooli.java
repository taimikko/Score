package msa.harj.score.model;

public class KayttajaRooli {
	private Long id;
	private Long kayttajaId;
	private Long rooliId;

	public KayttajaRooli() {

	}

	public KayttajaRooli(Long id, Long kayttajaId, Long rooliId) {
		this.id = id;
		this.kayttajaId = kayttajaId;
		this.rooliId = rooliId;
	}

	public KayttajaRooli(Long kayttajaId, Long rooliId) {
		this.id = 0L;
		this.kayttajaId = kayttajaId;
		this.rooliId = rooliId;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getKayttajaId() {
		return kayttajaId;
	}

	public void setUserId(Long kayttajaId) {
		this.kayttajaId = kayttajaId;
	}

	public Long getRooliId() {
		return rooliId;
	}

	public void setRooliId(Long rooliId) {
		this.rooliId = rooliId;
	}

	@Override
	public String toString() {
		return Long.toString(this.id) + ":" + Long.toString(this.kayttajaId) + " " + Long.toString(this.rooliId);
	}
}
