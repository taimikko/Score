package msa.harj.score.model;

public class Vayla {
	private Long id;
	private Long kentta_id;
	private Integer numero;
	private String nimi;
	private Integer par;
	private Integer pit1;
	private Integer pit2;
	private Integer pit3;
	private Integer pit4;
	private Integer hcp;

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

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getNimi() {
		return nimi;
	}

	public void setNimi(String nimi) {
		this.nimi = nimi;
	}

	public Integer getPar() {
		return par;
	}

	public void setPar(Integer par) {
		this.par = par;
	}

	public Integer getPit1() {
		return pit1;
	}

	public void setPit1(Integer pit1) {
		this.pit1 = pit1;
	}

	public Integer getPit2() {
		return pit2;
	}

	public void setPit2(Integer pit2) {
		this.pit2 = pit2;
	}

	public Integer getPit3() {
		return pit3;
	}

	public void setPit3(Integer pit3) {
		this.pit3 = pit3;
	}

	public Integer getPit4() {
		return pit4;
	}

	public void setPit4(Integer pit4) {
		this.pit4 = pit4;
	}

	public Integer getHcp() {
		return hcp;
	}

	public void setHcp(Integer hcp) {
		this.hcp = hcp;
	}

	public Vayla(Long id, Long kentta_id, Integer numero, String nimi, Integer par, Integer pit1, Integer pit2,
			Integer pit3, Integer pit4, Integer hcp) {
		super();
		this.id = id;
		this.kentta_id = kentta_id;
		this.numero = numero;
		this.nimi = nimi;
		this.par = par;
		this.pit1 = pit1;
		this.pit2 = pit2;
		this.pit3 = pit3;
		this.pit4 = pit4;
		this.hcp = hcp;
	}

	@Override
	public String toString() {
		return "Vayla [id=" + id + ", kentta_id=" + kentta_id + ", numero=" + numero + ", nimi=" + nimi + ", par=" + par
				+ ", pit1=" + pit1 + ", pit2=" + pit2 + ", pit3=" + pit3 + ", pit4=" + pit4 + ", hcp=" + hcp + "]";
	}

}
