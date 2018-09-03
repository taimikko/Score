package org.o7planning.sbsecurity.dao;

import javax.sql.DataSource;

import org.o7planning.sbsecurity.model.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class UserRoleDAO extends JdbcDaoSupport{

    @Autowired
    public UserRoleDAO(DataSource dataSource) {
        this.setDataSource(dataSource);
    }

	public void addNewUserRole(UserRole userRole) {
		String sql = "INSERT INTO user_role (id, user_id, role_id) values (?, ?, ?)";
		Object[] args = new Object[] { 0, userRole.getUserId(), userRole.getRoleId() }; 
		
		
		int info = this.getJdbcTemplate().update(sql, args);
		System.out.println("päivitettiin "+Integer.toString(info)+" riviä user_role tauluun.");
		// TODO: ei ole mitään virhekäsittelyä
	}
    
}
