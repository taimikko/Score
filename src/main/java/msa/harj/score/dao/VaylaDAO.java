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

import msa.harj.score.model.Vayla;

@Repository
@Transactional
public class VaylaDAO extends JdbcDaoSupport {
	static final Log log = LogFactory.getLog(VaylaDAO.class);

	@Autowired
	public VaylaDAO(DataSource ds) {
		this.setDataSource(ds);
	}

	public List<Vayla> getKentanVaylat(Long kenttaId) {
		String sql = "SELECT * FROM vayla WHERE kentta_id = ? ORDER BY numero";
		Object[] args = new Object[] { kenttaId };
		List<Vayla> vaylat = this.getJdbcTemplate().query(sql, args, VAYLA_MAPPER);
		return vaylat;
	}

	public void deleteVayla(Long vaylaId) {
		this.getJdbcTemplate().update("DELETE FROM vayla WHERE id=?", vaylaId);
	}

	public Vayla getVayla(Long vaylaId) {
		String sql = "SELECT * FROM vayla WHERE id=?";
		Object[] args = new Object[] { vaylaId };
		return this.getJdbcTemplate().queryForObject(sql, args, VAYLA_MAPPER);
	}

	public void updateVayla(Vayla v) {
		String sql = "UPDATE vayla SET kentta_id=?, numero=?, nimi=?, par=?, pit1=?, pit2=?, pit3=?, pit4=?, hcp=? WHERE id=?";
		Object[] args = new Object[] { v.getKentta_id(), v.getNumero(), v.getNimi(), v.getPar(), v.getPit1(),
				v.getPit2(), v.getPit3(), v.getPit4(), v.getHcp(), v.getId() };
		this.getJdbcTemplate().update(sql, args);
	}

	public void addVayla(Vayla v) {
		String sql = "INSERT INTO vayla (id, kentta_id, numero, nimi, par, pit1, pit2, pit3, pit4, hcp) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] args = new Object[] { v.getId(), v.getKentta_id(), v.getNumero(), v.getNimi(), v.getPar(), v.getPit1(),
				v.getPit2(), v.getPit3(), v.getPit4(), v.getHcp() };
		this.getJdbcTemplate().update(sql, args);
	}

	private static RowMapper<Vayla> VAYLA_MAPPER = new RowMapper<Vayla>() {

		public Vayla mapRow(ResultSet rs, int row) throws SQLException {
			return new Vayla(rs.getLong("id"), rs.getLong("kentta_id"), rs.getInt("numero"), rs.getString("nimi"),
					rs.getInt("par"), rs.getInt("pit1"), rs.getInt("pit2"), rs.getInt("pit3"), rs.getInt("pit4"),
					rs.getInt("hcp"));
		}
	};

}
