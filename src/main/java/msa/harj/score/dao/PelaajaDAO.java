package msa.harj.score.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import msa.harj.score.model.Pelaaja;

@Repository
@Transactional
public class PelaajaDAO extends KayttajaDAO {
	private static final Log log = LogFactory.getLog(PelaajaDAO.class);

	private static String PELAAJA_SELECT = "SELECT k.kayttaja_id, k.kayttajatunnus, k.encryted_password, k.enabled, k.jasen_tyyppi,"
			+ " p.id, p.seura_id, p.jasennumero, k.sukunimi, k.etunimi, p.tasoitus, p.pvm, p.tasoitus_voimassa"
			+ " FROM pelaaja p, kayttaja k";
	private static String PELAAJA_NEWEST = " k.jasennumero=p.jasennumero AND k.seura_id = p.seura_id"
			+ "  AND  (p.seura_id, p.jasennumero, p.pvm) IN ( SELECT q.seura_id, q.jasennumero, max(q.pvm) as pvm"
			+ " FROM pelaaja q GROUP BY q.seura_id, q.jasennumero )";

	@Autowired
	public PelaajaDAO(DataSource dataSource) {
		super(dataSource);
		// this.setDataSource(dataSource);
	}

	public Pelaaja getPelaaja(String username) {
		String sql = PELAAJA_SELECT + " WHERE k.kayttajatunnus=? AND " + PELAAJA_NEWEST;
		Object[] params = new Object[] { username };
		try {
			Pelaaja pelaaja = this.getJdbcTemplate().queryForObject(sql, params, PELAAJA_MAPPER);
			return pelaaja;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	private static RowMapper<Pelaaja> PELAAJA_MAPPER = new RowMapper<Pelaaja>() {
		// HUOM: kayttaja_id <> pelaajan id ! Pelaaja.id voi muuttua kun tulee uusi
		// tasoitus, mutta jasennumero + seura_id yksilöi koko ajan

		public Pelaaja mapRow(ResultSet resultSet, int row) throws SQLException {
			return new Pelaaja(resultSet.getLong("kayttaja_id"), resultSet.getString("kayttajatunnus"),
					resultSet.getBoolean("enabled"), resultSet.getLong("id"), resultSet.getLong("seura_id"),
					resultSet.getLong("jasennumero"), resultSet.getString("sukunimi"), resultSet.getString("etunimi"),
					resultSet.getInt("jasen_tyyppi"), resultSet.getDouble("tasoitus"),
					resultSet.getBoolean("tasoitus_voimassa"), resultSet.getTimestamp("pvm"));
		}
	};

	public Pelaaja getPelaaja(Long seuranumero, Long jasennumero) {
		String sql = PELAAJA_SELECT + " WHERE k.seura_id=? AND k.jasennumero=? AND " + PELAAJA_NEWEST;
		log.info(sql);
		Object[] params = new Object[] { seuranumero, jasennumero };
		try {
			Pelaaja pelaaja = this.getJdbcTemplate().queryForObject(sql, params, PELAAJA_MAPPER);
			log.info("MSA: getPelaaja() löysi " + pelaaja);
			return pelaaja;
		} catch (EmptyResultDataAccessException e) {
			log.info("MSA: ei löytynyt pelaajaa " + jasennumero + " seurasta " + seuranumero);
			return null;
		}
	}

	public void deletePelaajaHistoria(Long seuranumero, Long jasennumero) {
		String sql = "DELETE FROM pelaaja WHERE seura_id=? AND jasennumero=? ";
		log.info(sql);
		Object[] args = new Object[] { seuranumero, jasennumero };
		log.info("MSA: args:" + argStr(args));
		
		int lkm = this.getJdbcTemplate().update(sql, args);
		log.info("MSA: poistettu " + lkm + " rivi taulusta pelaaja (" + argStr(args)+")");
	}

	public void deletePelaaja(Long pelaajaId) {
		// poistaa vain yhden rivin pelaajan historiasta?
		int lkm = this.getJdbcTemplate().update("DELETE FROM pelaaja WHERE id=?", pelaajaId);
		log.info("MSA: poistettu " + lkm + " rivi taulusta pelaaja (id=" + pelaajaId+")");
	}

	public Pelaaja getPelaaja(Long pelaajaId) {
		// HUOM: id viittaa yhteen riviin pelaaja-taulussam jossa yhdellä pelaajalla voi
		// olla useita rivejä
		String sql = PELAAJA_SELECT + " WHERE p.id=? AND k.jasennumero=p.jasennumero AND k.seura_id = p.seura_id";
		Object[] params = new Object[] { pelaajaId };
		try {
			Pelaaja pelaaja = this.getJdbcTemplate().queryForObject(sql, params, PELAAJA_MAPPER);
			return pelaaja;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public List<Pelaaja> getPelaajaHistoria(Long seuranumero, Long jasennumero) {
		log.info("MSA: getPelaajaHistoria(" + Long.toString(seuranumero) + ", " + Long.toString(jasennumero) + ")");
		String sql = PELAAJA_SELECT + " WHERE k.seura_id = ? AND k.jasennumero=? "
				+ " AND k.jasennumero=p.jasennumero AND k.seura_id = p.seura_id" + " ORDER BY pvm";
		Object[] args = new Object[] { seuranumero, jasennumero };
		return this.getJdbcTemplate().query(sql, args, PELAAJA_MAPPER);
	}

	public List<Pelaaja> getSeuranPelaajat(Long seuranumero) {
		log.info("MSA: getSeuranPelaajat(" + Long.toString(seuranumero) + ")");
		String sql = PELAAJA_SELECT + " WHERE p.seura_id = ? AND " + PELAAJA_NEWEST + " ORDER BY p.seura_id, p.jasennumero";
		Object[] args = new Object[] { seuranumero };
		return this.getJdbcTemplate().query(sql, args, PELAAJA_MAPPER);
	}

	public void updatePelaaja(Pelaaja p) {
		log.info("MSA: updatePelaaja(" + p.getUsername() + ")");
		// päivitys tehdään lisäämällä uusi rivi
		addPelaaja(p);
	}

	public void addPelaaja(Pelaaja p) {
		log.info("MSA: addPelaaja "+p.toString());
		String sql = "INSERT INTO pelaaja ("
				+ "id, pvm, seura_id, jasennumero, tasoitus, tasoitus_voimassa) "
				+ "values (?, ?, ?, ?, ?, ?)";
		Object[] args = new Object[] { 0, null, p.getSeuraId(), p.getJasennumero(), 
				p.getTasoitus(), p.isTasoitus_voimassa() };

		try {
			log.info("MSA addPelaaja: " + sql);
			log.info("MSA: args:" + argStr(args));
			int info = this.getJdbcTemplate().update(sql, args);
			log.info("MSA: Lisättiin " + Integer.toString(info) + " pelaajaa tauluun.");
		} catch (Exception e) {
			log.info("MSA: poikkeus: " + e.getMessage());
		}
	}

	private String argStr(Object[] args) {
		String str = new String("");
		if (args != null)
			for (Object o : args) {
				if (o != null) {
				str += " " + o.toString();
				}
				else {
					str+=" null";
				}
			}
		return str;
	}

}
