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

import msa.harj.score.model.Kentta;

@Repository
@Transactional
public class KenttaDAO extends JdbcDaoSupport {
	private static final Log log = LogFactory.getLog(KenttaDAO.class);

	@Autowired
	public KenttaDAO(DataSource dataSource) {
		this.setDataSource(dataSource);
	}

	public List<Kentta> getKentat() {
		String sql = "SELECT *  FROM kentta ORDER BY seura_id, id";

		List<Kentta> kentat = this.getJdbcTemplate().query(sql, KENTTA_MAPPER);

		return kentat;
	}

	public void deleteKentta(Long kenttaId) {
		int lkm = this.getJdbcTemplate().update("DELETE FROM kentta WHERE id=?", kenttaId);
		log.info("MSA: Taulusta \"kentta\" poistettu " + lkm + " riviä (id=" + kenttaId+")");
	}

	public Kentta getKentta(Long kenttaId) {
		String sql = "SELECT *  FROM kentta WHERE id=?";
		Object[] args = new Object[] { kenttaId };
		return this.getJdbcTemplate().queryForObject(sql, args, KENTTA_MAPPER);
	}

	public void updateKentta(Kentta k) {
		String sql = "UPDATE kentta SET seura_id=?, kentan_lyhenne=?, kentan_nimi=? WHERE id=?";
		Object[] args = new Object[] { k.getSeura_id(), k.getKentan_lyhenne(), k.getKentan_nimi(), k.getId() };
		int lkm = this.getJdbcTemplate().update(sql, args);
		log.info("MSA: updateKentta päivitti " + lkm + " riviä " + k);
	}

	public void addKentta(Kentta k) {
		String sql = "INSERT INTO kentta (id, seura_id, kentan_lyhenne, kentan_nimi) VALUES (?, ?, ?, ?)";
		Object[] args = new Object[] {  k.getId(), k.getSeura_id(), k.getKentan_lyhenne(), k.getKentan_nimi() };
		int lkm = this.getJdbcTemplate().update(sql, args);
		log.info("MSA: addKentta lisäsi " + lkm + " riviä " + k);
	}

	private static RowMapper<Kentta> KENTTA_MAPPER = new RowMapper<Kentta>() {

		public Kentta mapRow(ResultSet rs, int row) throws SQLException {
			return new Kentta(rs.getLong("id"), rs.getLong("seura_id"), rs.getString("kentan_lyhenne"),
					rs.getString("kentan_nimi"));
		}
	};

}
