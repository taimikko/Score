package msa.harj.score.dao;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class KierrosDAO extends JdbcDaoSupport{
	private static final Log log = LogFactory.getLog(KierrosDAO.class);
	
	@Autowired
	public KierrosDAO(DataSource ds) {
		this.setDataSource(ds);
	}
	
	


}
