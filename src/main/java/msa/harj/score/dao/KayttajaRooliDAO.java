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

import msa.harj.score.model.KayttajaRooli;

@Repository
@Transactional
public class KayttajaRooliDAO extends JdbcDaoSupport{
	private static final Log log = LogFactory.getLog(KayttajaRooliDAO.class);

    @Autowired
    public KayttajaRooliDAO(DataSource dataSource) {
        this.setDataSource(dataSource);
    }

	public void addKayttajaRooli(KayttajaRooli userRole) {
		String sql = "INSERT INTO kayttaja_rooli (id, kayttaja_id, rooli_id) values (?, ?, ?)";
		Object[] args = new Object[] { 0, userRole.getKayttajaId(), userRole.getRooliId() }; 
				
		int info = this.getJdbcTemplate().update(sql, args);
		log.info("MSA: päivitettiin "+Integer.toString(info)+" riviä kayttaja_rooli tauluun.");
	}

	public void addKayttajaRooli(Long kayttajaId, Long[] roolit) {
		String sql = "INSERT INTO kayttaja_rooli (id, kayttaja_id, rooli_id) values (?, ?, ?)";
		Object[] args ;
		for (Long r : roolit) {
			args = new Object[] { 0, kayttajaId, r }; 
			this.getJdbcTemplate().update(sql, args);
			log.info("MSA: päivitettiin kayttaja_rooli "+Long.toString(r)+" käyttäjälle "+Long.toString(kayttajaId));
		}
	}

	public List<KayttajaRooli> getKayttajanRoolit(Long kayttajaId) {
		String sql = "SELECT * FROM kayttaja_rooli WHERE kayttaja_id = ?";
		Object[] args = new Object[] { kayttajaId }; 
		
		return this.getJdbcTemplate().query(sql, args, KR_MAPPER);
	}

	private static RowMapper<KayttajaRooli> KR_MAPPER = new RowMapper<KayttajaRooli>() {

		public KayttajaRooli mapRow(ResultSet resultSet, int row) throws SQLException {
			return new KayttajaRooli(resultSet.getLong("id"), resultSet.getLong("kayttaja_id"), resultSet.getLong("rooli_id"));
		}

	};
    
}
