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

import msa.harj.score.model.Seura;

@Repository
@Transactional
public class SeuraDAO extends JdbcDaoSupport {
	private static final Log log = LogFactory.getLog(SeuraDAO.class);

	@Autowired
	public SeuraDAO(DataSource dataSource) {
		this.setDataSource(dataSource);
	}

	public List<Seura> getSeurat() {
		String sql = "SELECT DISTINCT id, lyhenne, nimi FROM seura ORDER BY id";

		List<Seura> seurat = this.getJdbcTemplate().query(sql, SEURA_MAPPER);

		return seurat;
	}
	
	public void deleteSeura(Long seuraId) {
		int lkm = this.getJdbcTemplate().update("DELETE FROM seura WHERE id=?", seuraId);
		log.info("MSA: Taulusta \"seura\" poistettu " + lkm + " riviä (id=" + seuraId+")");
	}

	public Seura getSeura(Long seuraId) {
		String sql = "SELECT *  FROM seura WHERE id=?";
		Object[] args = new Object[] { seuraId };
		return this.getJdbcTemplate().queryForObject(sql, args, SEURA_MAPPER);
	}

	public void updateSeura(Seura s) {
		String sql = "UPDATE seura SET lyhenne=?, nimi=? WHERE id=?";
		Object[] args = new Object[] { s.getLyhenne(), s.getNimi(), s.getId() };
		int lkm = this.getJdbcTemplate().update(sql, args);
		log.info("MSA: updateSeura päivitti " + lkm + " riviä " + s);
	}

	public void addSeura(Seura s) {
		String sql = "INSERT INTO seura (id, lyhenne, nimi) VALUES (?, ?, ?)";
		Object[] args = new Object[] {  s.getId(), s.getLyhenne(), s.getNimi() };
		int lkm = this.getJdbcTemplate().update(sql, args);
		log.info("MSA: addSeura lisäsi " + lkm + " riviä " + s);
	}

	private static RowMapper<Seura> SEURA_MAPPER = new RowMapper<Seura>() {

		public Seura mapRow(ResultSet resultSet, int row) throws SQLException {
			return new Seura(resultSet.getLong("id"), resultSet.getString("lyhenne"), resultSet.getString("nimi"));
		}
	};

}
