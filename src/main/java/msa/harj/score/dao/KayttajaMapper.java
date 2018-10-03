package msa.harj.score.dao;
 
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import msa.harj.score.model.Kayttaja;
 
public class KayttajaMapper implements RowMapper<Kayttaja> {
 
    @Override
    public Kayttaja mapRow(ResultSet rs, int rowNum) throws SQLException {
 
        Long userId = rs.getLong("kayttaja_id");
        String username = rs.getString("kayttajatunnus");
        String encrytedPassword = rs.getString("encryted_password");
 
        return new Kayttaja(userId, username, encrytedPassword);
    }
 
}