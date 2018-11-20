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
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import msa.harj.score.model.Kayttaja;
import msa.harj.score.model.Kayttaja2;
import msa.harj.score.model.UusiKayttaja;

@Repository
@Transactional
public class KayttajaDAO extends JdbcDaoSupport {
	private static final Log log = LogFactory.getLog(KayttajaDAO.class);

	@Autowired
	public KayttajaDAO(DataSource dataSource) {
		this.setDataSource(dataSource);
	}

	public Kayttaja getKayttaja(String kayttajatunnus) {
		String sql = "SELECT * FROM kayttaja WHERE kayttajatunnus = ? ";

		Object[] params = new Object[] { kayttajatunnus };
		try {
			return this.getJdbcTemplate().queryForObject(sql, params, KAYTTAJA_MAPPER);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public void addNewUserAccount(UusiKayttaja uk) {
		// TODO: tätä ennen on lisättävä pelaaja omaan tauluun, koska usr on rajoitettu
		// (poistettu toistaiseksi)
		String sql = "INSERT INTO kayttaja (kayttaja_id, kayttajatunnus, encryted_password, enabled, seura_id, jasennumero, etunimi, sukunimi, sukup, jasen_tyyppi) "
				+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] args = new Object[] { 0, uk.getUsername(), uk.getEncrytedPassword(), 1, uk.getSeuraId(),
				uk.getJasennumero(), uk.getEtunimi(), uk.getSukunimi(), uk.getSukup(), uk.getJasen_tyyppi() };

		int info = this.getJdbcTemplate().update(sql, args);
		System.out.println("päivitettiin " + Integer.toString(info) + " riviä kayttaja tauluun.");
	}

	public List<Kayttaja2> getKayttajat(Long seura) {
		String sql;
		if (seura == null) {
			sql = "SELECT k.kayttaja_id, k.kayttajatunnus, k.enabled, k.seura_id, k.jasennumero, k.etunimi, k.sukunimi, k.sukup, k.jasen_tyyppi,"
					+ " s.nimi as seura, t.tyyppi as tyyppi FROM kayttaja k, seura s, jasen_tyyppi t"
					+ " WHERE k.seura_id=s.id AND t.id = k.jasen_tyyppi ORDER BY seura_id, jasennumero LIMIT 100";
			return this.getJdbcTemplate().query(sql, KAYTTAJA2_MAPPER);
		} else {
			sql = "SELECT k.kayttaja_id, k.kayttajatunnus, k.enabled, k.seura_id, k.jasennumero, k.etunimi, k.sukunimi, k.sukup, k.jasen_tyyppi,"
					+ " s.nimi as seura, t.tyyppi as tyyppi FROM kayttaja k, seura s, jasen_tyyppi t"
					+ " WHERE k.seura_id=s.id AND t.id = k.jasen_tyyppi AND k.seura_id = ? ORDER BY seura_id, jasennumero LIMIT 100";
			Object[] args = new Object[] { seura };
			return this.getJdbcTemplate().query(sql, args, KAYTTAJA2_MAPPER);
		}
	}

	private static RowMapper<Kayttaja> KAYTTAJA_MAPPER = new RowMapper<Kayttaja>() {

		public Kayttaja mapRow(ResultSet resultSet, int row) throws SQLException {
			return new Kayttaja(resultSet.getLong("kayttaja_id"), resultSet.getString("kayttajatunnus"),
					resultSet.getLong("seura_id"), resultSet.getLong("jasennumero"), resultSet.getBoolean("enabled"),
					resultSet.getString("etunimi"), resultSet.getString("sukunimi"), resultSet.getInt("sukup"),
					resultSet.getInt("jasen_tyyppi"));
		}

	};

	private static RowMapper<Kayttaja2> KAYTTAJA2_MAPPER = new RowMapper<Kayttaja2>() {

		public Kayttaja2 mapRow(ResultSet resultSet, int row) throws SQLException {
			return new Kayttaja2(resultSet.getLong("kayttaja_id"), resultSet.getString("kayttajatunnus"),
					resultSet.getLong("seura_id"), resultSet.getLong("jasennumero"), resultSet.getBoolean("enabled"),
					resultSet.getString("etunimi"), resultSet.getString("sukunimi"), resultSet.getInt("sukup"),
					resultSet.getInt("jasen_tyyppi"), resultSet.getString("seura"), resultSet.getString("tyyppi"));
		}

	};

	public void updateKayttaja(Kayttaja kayttaja) {
		// jos käyttäjälle vaihdetaan seuraa tai jäsennumeroa niin aiemmat kierrokset
		// pitäisi poistaa, samoin tasoitushistoria ? TODO: otetaan jäsennumero ja seura
		// pois päivitettävistä muuttujista
		String sql = "UPDATE kayttaja SET kayttajatunnus=?, enabled=?, seura_id=?, jasennumero=?, etunimi=?, sukunimi=?, sukup=?, jasen_tyyppi=? WHERE kayttaja_id=?";
		if (kayttaja.getEnabled() == null) {
			log.info("MSA: enabled == null\t -> false");
			kayttaja.setEnabled(false);
		}
		Object[] args = new Object[] { kayttaja.getUsername(), kayttaja.getEnabled(), kayttaja.getSeuraId(),
				kayttaja.getJasennumero(), kayttaja.getEtunimi(), kayttaja.getSukunimi(), kayttaja.getSukup(),
				kayttaja.getJasentyyppi(), kayttaja.getKayttajaId() };
		int lkm = this.getJdbcTemplate().update(sql, args);
		log.info("MSA: updateKayttaja päivitti " + lkm + " riviä " + kayttaja);
	}

	public void deleteKayttaja(String kayttajatunnus) {
		int lkm = this.getJdbcTemplate().update("DELETE FROM kayttaja WHERE kayttajatunnus=?", kayttajatunnus);
		log.info("MSA: poistettu " + lkm + " riviä " + kayttajatunnus);
	}

	public Long haeVapaaJasennumero(Long seura_id) {
		String sql = "SELECT max(jasennumero)+1 as vapaanumero FROM kayttaja WHERE seura_id = ? ";
		Object[] params = new Object[] { seura_id };
		try {
			Long vapaaNumero = this.getJdbcTemplate().queryForObject(sql, params, new RowMapper<Long>() {
				public Long mapRow(ResultSet rs, int row) throws SQLException {
					return (rs.getLong("vapaanumero"));
				}
			});
			return vapaaNumero;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public Boolean onkoVarattu(String kayttajatunnus) {
		String sql = "SELECT count(kayttajatunnus) as lkm FROM kayttaja WHERE kayttajatunnus = ? ";
		Object[] params = new Object[] { kayttajatunnus };
		Integer lkm = this.getJdbcTemplate().queryForObject(sql, params, Integer.class);
		if (lkm > 0)
			return true; // varattu
		return false;
	}

}
