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
		String sql = "INSERT INTO kayttaja (kayttaja_id, kayttajatunnus, encryted_password, enabled, seura_id, jasennumero, etunimi, sukunimi) "
				+ "values (?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] args = new Object[] { 0, uk.getUsername(), uk.getEncrytedPassword(), 1, uk.getSeuraId(),
				uk.getJasennumero(), uk.getEtunimi(), uk.getSukunimi() };

		int info = this.getJdbcTemplate().update(sql, args);
		System.out.println("päivitettiin " + Integer.toString(info) + " riviä kayttaja tauluun.");
	}

	public List<Kayttaja> getKayttajat(Long seura) {
		String sql = "SELECT * FROM kayttaja WHERE seura_id = ? ORDER BY seura_id, jasennumero";
		Object[] args = new Object[] { seura };
		return this.getJdbcTemplate().query(sql, args, KAYTTAJA_MAPPER);
	}

	private static RowMapper<Kayttaja> KAYTTAJA_MAPPER = new RowMapper<Kayttaja>() {

		public Kayttaja mapRow(ResultSet resultSet, int row) throws SQLException {
			return new Kayttaja(resultSet.getLong("kayttaja_id"), resultSet.getString("kayttajatunnus"),
					resultSet.getLong("seura_id"), resultSet.getLong("jasennumero"), resultSet.getBoolean("enabled"),
					resultSet.getString("etunimi"), resultSet.getString("sukunimi"));
		}

	};

	public void updateKayttaja(Kayttaja kayttaja) {
		// jos käyttäjälle vaihdetaan seuraa tai jäsennumeroa niin aiemmat kierrokset pitäisi poistaa, samoin tasoitushistoria ? TODO:
		String sql = "UPDATE kayttaja SET kayttajatunnus=?, enabled=?, seura_id=?, jasennumero=?, etunimi=?, sukunimi=? WHERE kayttaja_id=?";
		Object[] args = new Object[] { kayttaja.getUsername(), kayttaja.getEnabled(), kayttaja.getSeuraId(),
				kayttaja.getJasennumero(), kayttaja.getEtunimi(), kayttaja.getSukunimi(), kayttaja.getKayttajaId() };
		int lkm = this.getJdbcTemplate().update(sql, args);
		log.info("MSA: updateKayttaja päivitti " + lkm + " riviä " + kayttaja);
	}

	public void deleteKayttaja(String kayttajatunnus) {
		int lkm = this.getJdbcTemplate().update("DELETE FROM kayttaja WHERE kayttajatunnus=?", kayttajatunnus);
		log.info("MSA: poistettu " + lkm + " riviä " + kayttajatunnus);
	}

}
