package msa.harj.score.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import msa.harj.score.model.Kierros;

@Repository
@Transactional
public class KierrosDAO extends JdbcDaoSupport {
	static final Log log = LogFactory.getLog(KierrosDAO.class);

	@Autowired
	public KierrosDAO(DataSource ds) {
		this.setDataSource(ds);
	}

	public Kierros getKierros(Long kierrosId) {
		String sql = "SELECT * FROM kierros WHERE id = ? ";

		Object[] params = new Object[] { kierrosId };
		try {
			return this.getJdbcTemplate().queryForObject(sql, params, KIERROS_MAPPER);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public void addKierros(Kierros k) {
		log.info("MSA: addKierros()" + k);
		String sql = "INSERT INTO kierros ( id, pvm, seura_id, jasennumero, kentta_id, tasoitus, tii_id, pelitasoitus, cba,\n"
				+ " h1, h2, h3, h4, h5, h6, h7, h8, h9, h_out," + " h10, h11, h12, h13, h14, h15, h16, h17, h18, h_in,"
				+ " yhteensa, merkitsija, lisatieto,"
				+ " p1, p2, p3, p4, p5, p6, p7, p8, p9, p_out, p10, p11, p12, p13, p14, p15, p16, p17, p18, p_in,\n"
				+ " p_yht, tasoituskierros, uusi_tasoitus, pelattu, etunimi, sukunimi)\n"
				+ " values (?,?,?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?)";
		Object[] args = new Object[] { 0, k.getPvm(), k.getSeura_id(), k.getJasennumero(), k.getKentta_id(),
				k.getTasoitus(), k.getTii_id(), k.getPelitasoitus(), k.getCba(), k.getH1(), k.getH2(), k.getH3(),
				k.getH4(), k.getH5(), k.getH6(), k.getH7(), k.getH8(), k.getH9(), k.getHout(), k.getH10(), k.getH11(),
				k.getH12(), k.getH13(), k.getH14(), k.getH15(), k.getH16(), k.getH17(), k.getH18(), k.getHin(),
				k.getYhteensa(), k.getMerkitsija(), k.getLisatieto(), k.getP1(), k.getP2(), k.getP3(), k.getP4(),
				k.getP5(), k.getP6(), k.getP7(), k.getP8(), k.getP9(), k.getP_out(), k.getP10(), k.getP11(), k.getP12(),
				k.getP13(), k.getP14(), k.getP15(), k.getP16(), k.getP17(), k.getP18(), k.getP_in(), k.getP_yht(),
				k.isTasoituskierros(), k.getUusi_tasoitus(), k.getPelattu(), k.getEtunimi(), k.getSukunimi() };

		int lkm = this.getJdbcTemplate().update(sql, args);
		log.info("MSA: päivitettiin " + Integer.toString(lkm) + " rivi kierros -tauluun.");
	}

	public List<Kierros> getKierros(Long seuraId, Long pelaajaId) {
		String sql = "SELECT * FROM kierros WHERE seura_id = ? AND jasennumero = ?  ORDER BY pvm, id";
		Object[] args = new Object[] { seuraId, pelaajaId };
		return this.getJdbcTemplate().query(sql, args, KIERROS_MAPPER);
	}

	static RowMapper<Kierros> KIERROS_MAPPER = new RowMapper<Kierros>() {

		public Kierros mapRow(ResultSet rs, int row) throws SQLException {
			return new Kierros(rs.getLong("id"), rs.getDate("pvm"), rs.getLong("seura_id"), rs.getLong("jasennumero"),
					rs.getLong("kentta_id"), rs.getDouble("tasoitus"), rs.getLong("tii_id"), rs.getInt("pelitasoitus"),
					rs.getDouble("cba"), rs.getInt("h1"), rs.getInt("h2"), rs.getInt("h3"), rs.getInt("h4"),
					rs.getInt("h5"), rs.getInt("h6"), rs.getInt("h7"), rs.getInt("h8"), rs.getInt("h9"),
					rs.getInt("h_out"), rs.getInt("h10"), rs.getInt("h11"), rs.getInt("h12"), rs.getInt("h13"),
					rs.getInt("h14"), rs.getInt("h15"), rs.getInt("h16"), rs.getInt("h17"), rs.getInt("h18"),
					rs.getInt("h_in"), rs.getInt("yhteensa"), rs.getString("merkitsija"), rs.getString("lisatieto"),
					rs.getInt("p1"), rs.getInt("p2"), rs.getInt("p3"), rs.getInt("p4"), rs.getInt("p5"),
					rs.getInt("p6"), rs.getInt("p7"), rs.getInt("p8"), rs.getInt("p9"), rs.getInt("p_out"),
					rs.getInt("p10"), rs.getInt("p11"), rs.getInt("p12"), rs.getInt("p13"), rs.getInt("p14"),
					rs.getInt("p15"), rs.getInt("p16"), rs.getInt("p17"), rs.getInt("p18"), rs.getInt("p_in"),
					rs.getInt("p_yht"), rs.getBoolean("tasoituskierros"), rs.getDouble("uusi_tasoitus"),
					rs.getInt("pelattu"), rs.getString("etunimi"), rs.getString("sukunimi"));
		}

	};

	public void updateKierros(Kierros k) {
		String sql = "UPDATE kierros set pvm=?, seura_id=?, jasennumero=?, kentta_id=?, tasoitus=?, tii_id=?, pelitasoitus=?, cba=?,"
				+ " h1=?, h2=?, h3=?, h4=?, h5=?, h6=?, h7=?, h8=?, h9=?, h_out=?, h10=?, h11=?, h12=?, h13=?, h14=?, h15=?, h16=?, h17=?, h18=?, h_in=?,"
				+ " yhteensa=?, merkitsija=?, lisatieto=?,"
				+ " p1=?, p2=?, p3=?, p4=?, p5=?, p6=?, p7=?, p8=?, p9=?, p_out=?, p10=?, p11=?, p12=?, p13=?, p14=?, p15=?,p16=?,p17=?,p18=?, p_in=?,"
				+ " p_yht=?, tasoituskierros=?, uusi_tasoitus=?, pelattu=?, etunimi=?, sukunimi=? WHERE id = ?";

		Object[] args = new Object[] { k.getPvm(), k.getSeura_id(), k.getJasennumero(), k.getKentta_id(),
				k.getTasoitus(), k.getTii_id(), k.getPelitasoitus(), k.getCba(), k.getH1(), k.getH2(), k.getH3(),
				k.getH4(), k.getH5(), k.getH6(), k.getH7(), k.getH8(), k.getH9(), k.getHout(), k.getH10(), k.getH11(),
				k.getH12(), k.getH13(), k.getH14(), k.getH15(), k.getH16(), k.getH17(), k.getH18(), k.getHin(),
				k.getYhteensa(), k.getMerkitsija(), k.getLisatieto(), k.getP1(), k.getP2(), k.getP3(), k.getP4(),
				k.getP5(), k.getP6(), k.getP7(), k.getP8(), k.getP9(), k.getP_out(), k.getP10(), k.getP11(), k.getP12(),
				k.getP13(), k.getP14(), k.getP15(), k.getP16(), k.getP17(), k.getP18(), k.getP_in(), k.getP_yht(),
				k.isTasoituskierros(), k.getUusi_tasoitus(), k.getPelattu(), k.getEtunimi(), k.getSukunimi(),
				k.getId() };
		int lkm = this.getJdbcTemplate().update(sql, args);
		log.info("MSA: updateKierros päivitti " + lkm + " riviä (id=" + k.getId() + ") " + k.getPelattu());
	}

	public void deleteKierros(long kierrosId) {
		int lkm = this.getJdbcTemplate().update("DELETE FROM kierros WHERE id=?", kierrosId);
		log.info("MSA: Taulusta \"kierros\" poistettu " + lkm + " riviä (id=" + kierrosId + ")");
	}

	public List<Kierros> getSeuraKierrokset(Long seuraId) {
		String sql;
		Object[] args;
		if (seuraId == null || seuraId == 0L) {
			sql = "SELECT * FROM kierros ORDER BY pvm, seura_id, jasennumero";
			args = new Object[] {};
		} else {
			sql = "SELECT * FROM kierros WHERE seura_id = ? ORDER BY pvm, seura_id, jasennumero";
			args = new Object[] { seuraId };
		}
		return this.getJdbcTemplate().query(sql, args, KIERROS_MAPPER);
	}

	private String addLong(String sql, String kentta, Long luku) {
		String new_sql = "";

		if (luku == null || luku == 0L) {
			new_sql = "";
		} else {
			new_sql = " " + kentta + " = " + luku + " ";
		}
		if ((sql.length() > 0) && (new_sql.length() > 0)) {
			new_sql = sql + " AND " + new_sql;
		} else {
			new_sql = sql + new_sql;
		}
		return new_sql;
	}

	private String addInteger(String sql, String kentta, Integer luku) {
		String new_sql = "";

		if (luku == null || luku == 0) {
			new_sql = "";
		} else {
			new_sql = " " + kentta + " = " + luku + " ";
		}
		if ((sql.length() > 0) && (new_sql.length() > 0)) {
			new_sql = sql + " AND " + new_sql;
		} else {
			new_sql = sql + new_sql;
		}
		return new_sql;
	}

	private String addString(String sql, String kentta, String str) {
		String new_sql = "";

		if (str == null || str == "") {
			new_sql = "";
		} else {
			new_sql = " " + kentta + " = " + str + " ";
		}
		if ((sql.length() > 0) && (new_sql.length() > 0)) {
			new_sql = sql + " AND " + new_sql;
		} else {
			new_sql = sql + new_sql;
		}
		return new_sql;
	}

	private String addBool(String sql, String kentta, Boolean b) {
		String new_sql = "";

		if (b == null) {
			new_sql = "";
		} else {
			new_sql = " " + kentta + " = " + (b ? "true" : "false") + " ";
		}
		if ((sql.length() > 0) && (new_sql.length() > 0)) {
			new_sql = sql + " AND " + new_sql;
		} else {
			new_sql = sql + new_sql;
		}
		return new_sql;
	}

	private String addDate(String sql, String kentta, Date d, String operand) {
		String new_sql = "";
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
		if (d == null) {
			new_sql = "";
		} else {
			new_sql = " " + kentta + " " + operand + " '" + df.format(d) + "' ";
			log.info("addDate " + new_sql);
		}
		if ((sql.length() > 0) && (new_sql.length() > 0)) {
			new_sql = sql + " AND " + new_sql;
		} else {
			new_sql = sql + new_sql;
		}
		return new_sql;
	}

	public List<Kierros> getKentanKierrokset(Long kentta_id, Long jasennumero, String etunimi, String sukunimi,
			Long seura, Boolean tasoituskierros, Long pisteet, Date alkupvm, Date loppupvm, Integer pelattu) {
		/*
		 * Id Pvm Tii Lyönnit 9/18 Lisätieto
		 */

		String sql = "";

		sql = addLong(sql, "kentta_id", kentta_id);
		sql = addLong(sql, "jasennumero", jasennumero);
		sql = addString(sql, "etunimi", etunimi);
		sql = addString(sql, "sukunimi", sukunimi);
		sql = addLong(sql, "seura_id", seura);
		sql = addBool(sql, "tasoituskierros", tasoituskierros);
		sql = addDate(sql, "pvm", alkupvm, ">=");
		sql = addDate(sql, "pvm", loppupvm, "<=");
		if (pelattu!=null && (pelattu == 4)) {
			if (sql.length() > 0) {
				sql += " AND ";
			}
			sql += "(" + addInteger("", "pelattu", 1) + " OR " + addInteger("", "pelattu", 2) + ")";

		} else {
			sql = addInteger(sql, "pelattu", pelattu);
		}

		if (sql.length() > 0) {
			sql = "SELECT k.id, k.pvm, k.seura_id, s.nimi AS seura, k.jasennumero, k.kentta_id, e.kentan_nimi as kentta, "+
					"k.tasoitus, k.tii_id, t.tii_nimi as tii, k.pelitasoitus, k.cba, k.h_out, k.h_in, \n" + 
					"k.yhteensa, k.merkitsija, k.lisatieto, k.p_out, k.p_in, k.p_yht, k.tasoituskierros, k.uusi_tasoitus, k.pelattu, k.etunimi, k.sukunimi \n" + 
					"FROM kierros k, seura s, kentta e, tii t \n" + 
					"WHERE "+ sql +" AND k.seura_id = s.id AND k.kentta_id = e.id AND k.tii_id = t.id ORDER BY pvm, seura_id, jasennumero";
		} else {
			// jos ei ole mitään parametreja niin rajataan vain 100 ekaa
			sql = "SELECT k.id, k.pvm, k.seura_id, s.nimi AS seura, k.jasennumero, k.kentta_id, e.kentan_nimi as kentta, "+
					"k.tasoitus, k.tii_id, t.tii_nimi as tii, k.pelitasoitus, k.cba, k.h_out, k.h_in, \n" + 
					"k.yhteensa, k.merkitsija, k.lisatieto, k.p_out, k.p_in, k.p_yht, k.tasoituskierros, k.uusi_tasoitus, k.pelattu, k.etunimi, k.sukunimi \n" + 
					"FROM kierros k, seura s, kentta e, tii t \n" + 
					"WHERE k.seura_id = s.id AND k.kentta_id = e.id AND k.tii_id = t.id ORDER BY pvm, seura_id, jasennumero LIMIT 100";
		}
		log.info("getKentanKierrokset:" + sql);
		return this.getJdbcTemplate().query(sql, KIERROS_MAPPER2);
	}

	static RowMapper<Kierros> KIERROS_MAPPER2 = new RowMapper<Kierros>() {

		public Kierros mapRow(ResultSet rs, int row) throws SQLException {
			return new Kierros(rs.getLong("id"), rs.getDate("pvm"), rs.getLong("seura_id"), rs.getString("seura"),
					rs.getLong("jasennumero"), rs.getLong("kentta_id"), rs.getString("kentta"),
					rs.getDouble("tasoitus"), rs.getLong("tii_id"), rs.getString("tii"), rs.getInt("pelitasoitus"),
					rs.getDouble("cba"), rs.getInt("h_out"), rs.getInt("h_in"), rs.getInt("yhteensa"),
					rs.getString("merkitsija"), rs.getString("lisatieto"), rs.getInt("p_out"), rs.getInt("p_in"),
					rs.getInt("p_yht"), rs.getBoolean("tasoituskierros"), rs.getDouble("uusi_tasoitus"),
					rs.getInt("pelattu"), rs.getString("etunimi"), rs.getString("sukunimi"));
		}

	};

	public void deletePelaajanKierrokset(Long seuraId, Long jasennumero) {
		String sql = "DELETE FROM kierros WHERE seura_id=? AND jasennumero=?";
		Object[] args = new Object[] { seuraId, jasennumero };
		int lkm = this.getJdbcTemplate().update(sql, args);
		log.info("MSA: Taulusta \"kierros\" poistettu " + lkm + " riviä.");
	}

}
