package msa.harj.score.dao;
 
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
 
@Repository
@Transactional
public class RooliDAO extends JdbcDaoSupport {
 
    @Autowired
    public RooliDAO(DataSource dataSource) {
        this.setDataSource(dataSource);
    }
 
    public List<String> getRoleNames(Long userId) {
        String sql = "SELECT r.rooli_nimi " //
                + " FROM kayttaja_rooli ur, rooli r " //
                + " WHERE ur.rooli_id = r.rooli_id AND ur.kayttaja_id = ? ";
 
        Object[] params = new Object[] { userId };
 
        List<String> roles = this.getJdbcTemplate().queryForList(sql, params, String.class);
 
        return roles;
    }
     
}
