package msa.harj.sbsecurity.mapper;
 
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import msa.harj.sbsecurity.model.AppUser;
 
public class AppUserMapper implements RowMapper<AppUser> {
 
    public static final String BASE_SQL //
            = "SELECT u.user_id, u.user_name, u.encryted_password FROM app_user u ";
 
    @Override
    public AppUser mapRow(ResultSet rs, int rowNum) throws SQLException {
 
        Long userId = rs.getLong("user_id");
        String username = rs.getString("user_name");
        String encrytedPassword = rs.getString("encryted_password");
 
        return new AppUser(userId, username, encrytedPassword);
    }
 
}