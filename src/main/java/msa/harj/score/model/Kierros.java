package msa.harj.score.model;

import java.sql.Timestamp;

public class Kierros {
	// private static final Log log = LogFactory.getLog(Kayttaja.class);
	private Long id;
	private Timestamp pvm;
	private Long seura_id;
	private Long jasennumero;
	private Long kentta_id;
	private Double tasoitus;
	private Long tii_id;
	private Integer pelitasoitus;
	private Double cba;
	private Integer h1;
	private Integer h2;
	private Integer h3;
	private Integer h4;
	private Integer h5;
	private Integer h6;
	private Integer h7;
	private Integer h8;
	private Integer h9;
	private Integer out;
	private Integer h10;
	private Integer h11;
	private Integer h12;
	private Integer h13;
	private Integer h14;
	private Integer h15;
	private Integer h16;
	private Integer h17;
	private Integer h18;
	private Integer in;
	private Integer yhteensa;
	private String merkitsija;
	private String lisatieto;
	private Integer p1;
	private Integer p2;
	private Integer p3;
	private Integer p4;
	private Integer p5;
	private Integer p6;
	private Integer p7;
	private Integer p8;
	private Integer p9;
	private Integer p_out;
	private Integer p10;
	private Integer p11;
	private Integer p12;
	private Integer p13;
	private Integer p14;
	private Integer p15;
	private Integer p16;
	private Integer p17;
	private Integer p18;
	private Integer p_in;
	private Integer p_yht;
	private boolean tasoituskierros;
	private Double uusi_tasoitus;
	private Integer pelattu;

	
	public Kierros() {
		super();
	}

	public Kierros(Timestamp pvm, Long jasennumero, Long kentta_id) {
		super();
		this.pvm = pvm;
		this.jasennumero = jasennumero;
		this.kentta_id = kentta_id;
	}

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

	public Long getJasennumero() {
		return jasennumero;
	}

	public void setJasennumero(Long jasennumero) {
		this.jasennumero = jasennumero;
	}

	public Long getKentta_id() {
		return kentta_id;
	}

	public void setKentta_id(Long kentta_id) {
		this.kentta_id = kentta_id;
	}

	public Double getTasoitus() {
		return tasoitus;
	}

	public void setTasoitus(Double tasoitus) {
		this.tasoitus = tasoitus;
	}

	public Long getTii_id() {
		return tii_id;
	}

	public void setTii_id(Long tii_id) {
		this.tii_id = tii_id;
	}

	public Integer getPelitasoitus() {
		return pelitasoitus;
	}

	public void setPelitasoitus(Integer pelitasoitus) {
		this.pelitasoitus = pelitasoitus;
	}

	public Double getCba() {
		return cba;
	}

	public void setCba(Double cba) {
		this.cba = cba;
	}

	public Integer getH1() {
		return h1;
	}

	public void setH1(Integer h1) {
		this.h1 = h1;
	}

	public Integer getH2() {
		return h2;
	}

	public void setH2(Integer h2) {
		this.h2 = h2;
	}

	public Integer getH3() {
		return h3;
	}

	public void setH3(Integer h3) {
		this.h3 = h3;
	}

	public Integer getH4() {
		return h4;
	}

	public void setH4(Integer h4) {
		this.h4 = h4;
	}

	public Integer getH5() {
		return h5;
	}

	public void setH5(Integer h5) {
		this.h5 = h5;
	}

	public Integer getH6() {
		return h6;
	}

	public void setH6(Integer h6) {
		this.h6 = h6;
	}

	public Integer getH7() {
		return h7;
	}

	public void setH7(Integer h7) {
		this.h7 = h7;
	}

	public Integer getH8() {
		return h8;
	}

	public void setH8(Integer h8) {
		this.h8 = h8;
	}

	public Integer getH9() {
		return h9;
	}

	public void setH9(Integer h9) {
		this.h9 = h9;
	}

	public Integer getOut() {
		return out;
	}

	public void setOut(Integer out) {
		this.out = out;
	}

	public Integer getH10() {
		return h10;
	}

	public void setH10(Integer h10) {
		this.h10 = h10;
	}

	public Integer getH11() {
		return h11;
	}

	public void setH11(Integer h11) {
		this.h11 = h11;
	}

	public Integer getH12() {
		return h12;
	}

	public void setH12(Integer h12) {
		this.h12 = h12;
	}

	public Integer getH13() {
		return h13;
	}

	public void setH13(Integer h13) {
		this.h13 = h13;
	}

	public Integer getH14() {
		return h14;
	}

	public void setH14(Integer h14) {
		this.h14 = h14;
	}

	public Integer getH15() {
		return h15;
	}

	public void setH15(Integer h15) {
		this.h15 = h15;
	}

	public Integer getH16() {
		return h16;
	}

	public void setH16(Integer h16) {
		this.h16 = h16;
	}

	public Integer getH17() {
		return h17;
	}

	public void setH17(Integer h17) {
		this.h17 = h17;
	}

	public Integer getH18() {
		return h18;
	}

	public void setH18(Integer h18) {
		this.h18 = h18;
	}

	public Integer getIn() {
		return in;
	}

	public void setIn(Integer in) {
		this.in = in;
	}

	public Integer getYhteensa() {
		return yhteensa;
	}

	public void setYhteensa(Integer yhteensa) {
		this.yhteensa = yhteensa;
	}

	public String getMerkitsija() {
		return merkitsija;
	}

	public void setMerkitsija(String merkitsija) {
		this.merkitsija = merkitsija;
	}

	public String getLisatieto() {
		return lisatieto;
	}

	public void setLisatieto(String lisatieto) {
		this.lisatieto = lisatieto;
	}

	public Integer getP1() {
		return p1;
	}

	public void setP1(Integer p1) {
		this.p1 = p1;
	}

	public Integer getP2() {
		return p2;
	}

	public void setP2(Integer p2) {
		this.p2 = p2;
	}

	public Integer getP3() {
		return p3;
	}

	public void setP3(Integer p3) {
		this.p3 = p3;
	}

	public Integer getP4() {
		return p4;
	}

	public void setP4(Integer p4) {
		this.p4 = p4;
	}

	public Integer getP5() {
		return p5;
	}

	public void setP5(Integer p5) {
		this.p5 = p5;
	}

	public Integer getP6() {
		return p6;
	}

	public void setP6(Integer p6) {
		this.p6 = p6;
	}

	public Integer getP7() {
		return p7;
	}

	public void setP7(Integer p7) {
		this.p7 = p7;
	}

	public Integer getP8() {
		return p8;
	}

	public void setP8(Integer p8) {
		this.p8 = p8;
	}

	public Integer getP9() {
		return p9;
	}

	public void setP9(Integer p9) {
		this.p9 = p9;
	}

	public Integer getP_out() {
		return p_out;
	}

	public void setP_out(Integer p_out) {
		this.p_out = p_out;
	}

	public Integer getP10() {
		return p10;
	}

	public void setP10(Integer p10) {
		this.p10 = p10;
	}

	public Integer getP11() {
		return p11;
	}

	public void setP11(Integer p11) {
		this.p11 = p11;
	}

	public Integer getP12() {
		return p12;
	}

	public void setP12(Integer p12) {
		this.p12 = p12;
	}

	public Integer getP13() {
		return p13;
	}

	public void setP13(Integer p13) {
		this.p13 = p13;
	}

	public Integer getP14() {
		return p14;
	}

	public void setP14(Integer p14) {
		this.p14 = p14;
	}

	public Integer getP15() {
		return p15;
	}

	public void setP15(Integer p15) {
		this.p15 = p15;
	}

	public Integer getP16() {
		return p16;
	}

	public void setP16(Integer p16) {
		this.p16 = p16;
	}

	public Integer getP17() {
		return p17;
	}

	public void setP17(Integer p17) {
		this.p17 = p17;
	}

	public Integer getP18() {
		return p18;
	}

	public void setP18(Integer p18) {
		this.p18 = p18;
	}

	public Integer getP_in() {
		return p_in;
	}

	public void setP_in(Integer p_in) {
		this.p_in = p_in;
	}

	public Integer getP_yht() {
		return p_yht;
	}

	public void setP_yht(Integer p_yht) {
		this.p_yht = p_yht;
	}

	public boolean isTasoituskierros() {
		return tasoituskierros;
	}

	public void setTasoituskierros(boolean tasoituskierros) {
		this.tasoituskierros = tasoituskierros;
	}

	public Double getUusi_tasoitus() {
		return uusi_tasoitus;
	}

	public void setUusi_tasoitus(Double uusi_tasoitus) {
		this.uusi_tasoitus = uusi_tasoitus;
	}

	public Integer getPelattu() {
		return pelattu;
	}

	public void setPelattu(Integer pelattu) {
		this.pelattu = pelattu;
	}

	public Long getSeura_id() {
		return seura_id;
	}

	public void setSeura_id(Long seura_id) {
		this.seura_id = seura_id;
	}

	@Override
	public String toString() {
		return "Kierros [id=" + id + ", pvm=" + pvm + ", seura_id=" + seura_id + ", jasennumero=" + jasennumero
				+ ", kentta_id=" + kentta_id + ", tasoitus=" + tasoitus + ", tii_id=" + tii_id + ", pelitasoitus="
				+ pelitasoitus + ", cba=" + cba + ", h1=" + h1 + ", h2=" + h2 + ", h3=" + h3 + ", h4=" + h4 + ", h5="
				+ h5 + ", h6=" + h6 + ", h7=" + h7 + ", h8=" + h8 + ", h9=" + h9 + ", out=" + out + ", h10=" + h10
				+ ", h11=" + h11 + ", h12=" + h12 + ", h13=" + h13 + ", h14=" + h14 + ", h15=" + h15 + ", h16=" + h16
				+ ", h17=" + h17 + ", h18=" + h18 + ", in=" + in + ", yhteensa=" + yhteensa + ", merkitsija="
				+ merkitsija + ", lisatieto=" + lisatieto + ", p1=" + p1 + ", p2=" + p2 + ", p3=" + p3 + ", p4=" + p4
				+ ", p5=" + p5 + ", p6=" + p6 + ", p7=" + p7 + ", p8=" + p8 + ", p9=" + p9 + ", p_out=" + p_out
				+ ", p10=" + p10 + ", p11=" + p11 + ", p12=" + p12 + ", p13=" + p13 + ", p14=" + p14 + ", p15=" + p15
				+ ", p16=" + p16 + ", p17=" + p17 + ", p18=" + p18 + ", p_in=" + p_in + ", p_yht=" + p_yht
				+ ", tasoituskierros=" + tasoituskierros + ", uusi_tasoitus=" + uusi_tasoitus + ", pelattu=" + pelattu
				+ "]";
	}

	public Kierros(Long id, Timestamp pvm, Long seura_id, Long jasennumero, Long kentta_id, Double tasoitus,
			Long tii_id, Integer pelitasoitus, Double cba, Integer h1, Integer h2, Integer h3, Integer h4, Integer h5,
			Integer h6, Integer h7, Integer h8, Integer h9, Integer out, Integer h10, Integer h11, Integer h12,
			Integer h13, Integer h14, Integer h15, Integer h16, Integer h17, Integer h18, Integer in, Integer yhteensa,
			String merkitsija, String lisatieto, Integer p1, Integer p2, Integer p3, Integer p4, Integer p5, Integer p6,
			Integer p7, Integer p8, Integer p9, Integer p_out, Integer p10, Integer p11, Integer p12, Integer p13,
			Integer p14, Integer p15, Integer p16, Integer p17, Integer p18, Integer p_in, Integer p_yht,
			boolean tasoituskierros, Double uusi_tasoitus, Integer pelattu) {
		super();
		this.id = id;
		this.pvm = pvm;
		this.seura_id = seura_id;
		this.jasennumero = jasennumero;
		this.kentta_id = kentta_id;
		this.tasoitus = tasoitus;
		this.tii_id = tii_id;
		this.pelitasoitus = pelitasoitus;
		this.cba = cba;
		this.h1 = h1;
		this.h2 = h2;
		this.h3 = h3;
		this.h4 = h4;
		this.h5 = h5;
		this.h6 = h6;
		this.h7 = h7;
		this.h8 = h8;
		this.h9 = h9;
		this.out = out;
		this.h10 = h10;
		this.h11 = h11;
		this.h12 = h12;
		this.h13 = h13;
		this.h14 = h14;
		this.h15 = h15;
		this.h16 = h16;
		this.h17 = h17;
		this.h18 = h18;
		this.in = in;
		this.yhteensa = yhteensa;
		this.merkitsija = merkitsija;
		this.lisatieto = lisatieto;
		this.p1 = p1;
		this.p2 = p2;
		this.p3 = p3;
		this.p4 = p4;
		this.p5 = p5;
		this.p6 = p6;
		this.p7 = p7;
		this.p8 = p8;
		this.p9 = p9;
		this.p_out = p_out;
		this.p10 = p10;
		this.p11 = p11;
		this.p12 = p12;
		this.p13 = p13;
		this.p14 = p14;
		this.p15 = p15;
		this.p16 = p16;
		this.p17 = p17;
		this.p18 = p18;
		this.p_in = p_in;
		this.p_yht = p_yht;
		this.tasoituskierros = tasoituskierros;
		this.uusi_tasoitus = uusi_tasoitus;
		this.pelattu = pelattu;
	}

}
