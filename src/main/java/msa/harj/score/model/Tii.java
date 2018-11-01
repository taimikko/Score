package msa.harj.score.model;

public class Tii {
	private Long id;
	private Long kentta_id;
	private Long tii_id;
	private String tii_nimi;
	private String tii_lyhenne;
	private Long slope;
	private Double cr;
	private Long slope_n;
	private Double cr_n;

	public Long getSlope_n() {
		return slope_n;
	}

	public void setSlope_n(Long slope_n) {
		this.slope_n = slope_n;
	}

	public Double getCr_n() {
		return cr_n;
	}

	public void setCr_n(Double cr_n) {
		this.cr_n = cr_n;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getKentta_id() {
		return kentta_id;
	}

	public void setKentta_id(Long kentta_id) {
		this.kentta_id = kentta_id;
	}

	public Long getTii_id() {
		return tii_id;
	}

	public void setTii_id(Long tii_id) {
		this.tii_id = tii_id;
	}

	public String getTii_nimi() {
		return tii_nimi;
	}

	public void setTii_nimi(String tii_nimi) {
		this.tii_nimi = tii_nimi;
	}

	public String getTii_lyhenne() {
		return tii_lyhenne;
	}

	public void setTii_lyhenne(String tii_lyhenne) {
		this.tii_lyhenne = tii_lyhenne;
	}

	public Long getSlope() {
		return slope;
	}

	public void setSlope(Long slope) {
		this.slope = slope;
	}

	public Double getCr() {
		return cr;
	}

	public void setCr(Double cr) {
		this.cr = cr;
	}

	public Tii(Long id, Long kentta_id, Long tii_id, String tii_nimi, String tii_lyhenne, Long slope, Double cr,
			Long slope_n, Double cr_n) {
		super();
		this.id = id;
		this.kentta_id = kentta_id;
		this.tii_id = tii_id;
		this.tii_nimi = tii_nimi;
		this.tii_lyhenne = tii_lyhenne;
		this.slope = slope;
		this.cr = cr;
		this.slope_n = slope_n;
		this.cr_n = cr_n;
	}

	@Override
	public String toString() {
		return "Tii [id=" + id + ", kentta_id=" + kentta_id + ", tii_id=" + tii_id + ", tii_nimi=" + tii_nimi
				+ ", tii_lyhenne=" + tii_lyhenne + ", slope=" + slope + ", cr=" + cr + ", slope_n=" + slope_n
				+ ", cr_n=" + cr_n + "]";
	}


}
