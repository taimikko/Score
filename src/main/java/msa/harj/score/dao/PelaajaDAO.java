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

	private static String PELAAJA_SELECT = "SELECT k.kayttaja_id, k.kayttajatunnus, k.encryted_password, k.enabled, "
			+ " p.id, p.seura_id, p.jasennumero, k.sukunimi, k.etunimi, p.sukup, p.jasen_tyyppi, p.tasoitus, p.pvm, p.tasoitus_voimassa"
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

//		 SELECT k.kayttaja_id, k.kayttajatunnus, k.encryted_password,
//	      p.id, p.seura_id, p.jasennumero, p.sukunimi, p.etunimi, p.sukup, p.jasen_tyyppi, p.tasoitus, p.pvm
//	      FROM kayttaja k, pelaaja p 
//	      INNER JOIN (  
//	       SELECT seura_id as sid, jasennumero as jnro, max(pvm) as maxpvm 
//	        FROM pelaaja  
//	        GROUP BY seura_id, jasennumero) ij 
//	      ON sid = p.seura_id  AND jnro = p.jasennumero   AND p.pvm = ij.maxpvm 
//	      WHERE k.kayttajatunnus="msa" AND p.seura_id=k.seura_id AND p.jasennumero = k.jasennumero;
//	---------
//
//		SELECT k.kayttaja_id, k.kayttajatunnus, k.encryted_password,
//		 p.id, p.seura_id, p.jasennumero, p.sukunimi, p.etunimi, p.sukup, p.jasen_tyyppi, p.tasoitus, p.pvm
//		 FROM pelaaja p, kayttaja k  
//		 WHERE k.kayttajatunnus="msa" AND k.jasennumero=p.jasennumero AND k.seura_id = p.seura_id 
//		   AND  (p.seura_id, p.jasennumero, p.pvm) IN (
//				   SELECT q.seura_id, q.jasennumero, max(q.pvm) as pvm  
//				   FROM pelaaja q 
//				   GROUP BY q.seura_id, q.jasennumero );

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
					resultSet.getInt("sukup"), resultSet.getInt("jasen_tyyppi"), resultSet.getLong("tasoitus"),
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

	public void deletePelaaja(Long pelaajaId) {
		// poistaa vain yhden rivin pelaajan historiasta?
		log.info("MSA: deletePelaaja(" + Long.toString(pelaajaId) + ") on toteuttamatta!"); // TODO:
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
		String sql = PELAAJA_SELECT + " WHERE seura_id = ? AND " + PELAAJA_NEWEST + " ORDER BY seura_id, jasennumero";
		Object[] args = new Object[] { seuranumero };
		return this.getJdbcTemplate().query(sql, args, PELAAJA_MAPPER);
	}

	public void updatePelaaja(Pelaaja p) {
		log.info("MSA: updatePelaaja(" + p.getUsername() + ")");
		// päivitys tehdään lisäämällä uusi rivi
		addPelaaja(p);
	}

	public void addPelaaja(Pelaaja p) {
		String sql = "INSERT INTO pelaaja ("
				+ "id, pvm, seura_id, jasennumero, sukup, jasen_tyyppi, tasoitus, tasoitus_voimassa) "
				+ "values (?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] args = new Object[] { 0, null, p.getSeura_id(), p.getJasennumero(), p.getSukup(), p.getJasen_tyyppi(),
				p.getTasoitus(), p.isTasoitus_voimassa() };

		try {
			log.info("MSA addPelaaja: " + sql);
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
			log.info("MSA: args:" + str);
			int info = this.getJdbcTemplate().update(sql, args);
			log.info("MSA: Lisättiin " + Integer.toString(info) + " pelaajaa tauluun.");
		} catch (Exception e) {
			log.info("MSA: poikkeus: " + e.getMessage());
		}
	}

}
