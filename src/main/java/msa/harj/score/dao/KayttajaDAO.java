package msa.harj.score.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import msa.harj.score.model.Kayttaja;
import msa.harj.score.model.UusiKayttaja;

@Repository
@Transactional
public class KayttajaDAO extends JdbcDaoSupport {

	@Autowired
	public KayttajaDAO(DataSource dataSource) {
		this.setDataSource(dataSource);
	}

	public Kayttaja findUserAccount(String username) {
		String sql = "SELECT kayttaja_id, kayttajatunnus, encryted_password FROM kayttaja "
				+ " WHERE kayttajatunnus = ? ";

		Object[] params = new Object[] { username };
		KayttajaMapper mapper = new KayttajaMapper();
		try {
			Kayttaja userInfo = this.getJdbcTemplate().queryForObject(sql, params, mapper);
			return userInfo;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public void addNewUserAccount(UusiKayttaja usr) {
		// TODO: tätä ennen on lisättävä pelaaja omaan tauluun, koska usr on rajoitettu
		// (poistettu toistaiseksi)
		String sql = "INSERT INTO kayttaja (kayttaja_id, kayttajatunnus, encryted_password, enabled, seura_id, jasennumero) "
				+ "values (?, ?, ?, ?, ?, ?)";
		Object[] args = new Object[] { 0, usr.getUsername(), usr.getEncrytedPassword(), 1, usr.getSeuraId(), usr.getJasennumero() };

		int info = this.getJdbcTemplate().update(sql, args);
		System.out.println("päivitettiin " + Integer.toString(info) + " riviä kayttaja tauluun.");
	}

}
