package msa.harj.score.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import msa.harj.score.model.Rooli;

@Repository
@Transactional
public class RooliDAO extends JdbcDaoSupport {

	@Autowired
	public RooliDAO(DataSource dataSource) {
		this.setDataSource(dataSource);
	}

	public List<String> getRoleNames(Long kayttajaId) {
		String sql = "SELECT r.rooli_nimi " //
				+ " FROM kayttaja_rooli ur, rooli r " //
				+ " WHERE ur.rooli_id = r.rooli_id AND ur.kayttaja_id = ? ";

		Object[] params = new Object[] { kayttajaId };

		List<String> roles = this.getJdbcTemplate().queryForList(sql, params, String.class);

		return roles;
	}

	public List<Rooli> getRoolit() {
		String sql = "SELECT DISTINCT rooli_id, rooli_nimi FROM rooli ORDER BY rooli_id";

		List<Rooli> roles = this.getJdbcTemplate().query(sql, ROOLI_MAPPER);

		return roles;
	}

	private static RowMapper<Rooli> ROOLI_MAPPER = new RowMapper<Rooli>() {

		public Rooli mapRow(ResultSet resultSet, int row) throws SQLException {
			return new Rooli(resultSet.getLong("rooli_id"), resultSet.getString("rooli_nimi"));
		}
	};

}
