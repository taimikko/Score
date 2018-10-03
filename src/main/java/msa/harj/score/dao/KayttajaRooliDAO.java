package msa.harj.score.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import msa.harj.score.model.KayttajaRooli;

@Repository
@Transactional
public class KayttajaRooliDAO extends JdbcDaoSupport{

    @Autowired
    public KayttajaRooliDAO(DataSource dataSource) {
        this.setDataSource(dataSource);
    }

	public void addNewUserRole(KayttajaRooli userRole) {
		String sql = "INSERT INTO kayttaja_rooli (id, kayttaja_id, rooli_id) values (?, ?, ?)";
		Object[] args = new Object[] { 0, userRole.getUserId(), userRole.getRoleId() }; 
		
		
		int info = this.getJdbcTemplate().update(sql, args);
		System.out.println("päivitettiin "+Integer.toString(info)+" riviä kayttaja_rooli tauluun.");
		// TODO: ei ole mitään virhekäsittelyä
	}
    
}
