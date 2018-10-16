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

import msa.harj.score.model.Tii;

@Repository
@Transactional
public class TiiDAO extends JdbcDaoSupport {
	static final Log log = LogFactory.getLog(TiiDAO.class);

	@Autowired
	public TiiDAO(DataSource ds) {
		this.setDataSource(ds);
	}
	
	public List<Tii> getKaikkiTiit() {
		String sql = "SELECT *  FROM tii ORDER BY id";

		List<Tii> tiit = this.getJdbcTemplate().query(sql, TII_MAPPER);

		return tiit;
	}

	public List<Tii> getKentanTiit(Long kenttaId) {
		String sql = "SELECT *  FROM tii WHERE kentta_id = ? ORDER BY id";
		Object[] args = new Object[] { kenttaId };
		List<Tii> tiit = this.getJdbcTemplate().query(sql, args, TII_MAPPER);
		return tiit;
	}

	private static RowMapper<Tii> TII_MAPPER = new RowMapper<Tii>() {

		public Tii mapRow(ResultSet rs, int row) throws SQLException {
			return new Tii(rs.getLong("id"), rs.getLong("kentta_id"), rs.getLong("tii_id"), rs.getString("tii_nimi"),
					rs.getString("tii_lyhenne"), rs.getLong("slope"), rs.getDouble("cr"), rs.getInt("sukup"));
		}
	};


}
