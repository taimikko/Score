package msa.harj.score.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import msa.harj.score.model.JasenTyyppi;

@Repository
@Transactional
public class JasenTyyppiDAO extends JdbcDaoSupport {
	private static final Log log = LogFactory.getLog(JasenTyyppiDAO.class);

	@Autowired
	public JasenTyyppiDAO(DataSource dataSource) {
		this.setDataSource(dataSource);
	}

	public List<JasenTyyppi> getJasenTyypit() {
		String sql = "SELECT DISTINCT id, tyyppi, kuvaus FROM jasen_tyyppi ORDER BY id";

		List<JasenTyyppi> tyypit = this.getJdbcTemplate().query(sql, JASENTYYPPI_MAPPER);

		return tyypit;
	}

	private static RowMapper<JasenTyyppi> JASENTYYPPI_MAPPER = new RowMapper<JasenTyyppi>() {

		public JasenTyyppi mapRow(ResultSet resultSet, int row) throws SQLException {
			return new JasenTyyppi(resultSet.getLong("id"), resultSet.getString("tyyppi"),
					resultSet.getString("kuvaus"));
		}
	};

}
