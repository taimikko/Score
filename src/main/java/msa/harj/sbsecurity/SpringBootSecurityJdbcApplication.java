package msa.harj.sbsecurity;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import msa.harj.sbsecurity.config.WebSecurityConfig;

@SpringBootApplication
public class SpringBootSecurityJdbcApplication {
	private static final Log log = LogFactory.getLog(SpringBootSecurityJdbcApplication.class);

	public static void main(String[] args) {
		log.info("MSA DEBUG: main "+args.toString());
		log.debug("MSA DEBUG: main "+args.toString());
		log.error("MSA DEBUG: main "+args.toString());

		SpringApplication.run(SpringBootSecurityJdbcApplication.class, args);
	}
}
