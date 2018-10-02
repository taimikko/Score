package msa.harj.sbsecurity.dao;
 
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import msa.harj.sbsecurity.mapper.AppUserMapper;
import msa.harj.sbsecurity.model.AppUser;
import msa.harj.sbsecurity.model.NewUser;
import msa.harj.sbsecurity.utils.EncrytedPasswordUtils;
 
@Repository
@Transactional
public class AppUserDAO extends JdbcDaoSupport {
 
    @Autowired
    public AppUserDAO(DataSource dataSource) {
        this.setDataSource(dataSource);
    }
 
    public AppUser findUserAccount(String username) {
        // Select .. from App_User u Where u.User_Name = ?
        String sql = AppUserMapper.BASE_SQL + " where u.User_Name = ? ";
 
        Object[] params = new Object[] { username };
        AppUserMapper mapper = new AppUserMapper();
        try {
            AppUser userInfo = this.getJdbcTemplate().queryForObject(sql, params, mapper);
            return userInfo;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
 
	public void addNewUserAccount(NewUser usr) {
		String sql = "INSERT INTO app_user (user_id, user_name, encryted_password, enabled) " + "values (?, ?, ?, ?)";
		Object[] args = new Object[] { 0, usr.getUsername(), usr.getEncrytedPassword(), 1 };

		int info = this.getJdbcTemplate().update(sql, args);
		System.out.println("päivitettiin " + Integer.toString(info) + " riviä app_user tauluun.");
	}

}
