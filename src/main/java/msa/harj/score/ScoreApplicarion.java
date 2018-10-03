package msa.harj.score;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ScoreApplicarion {
	private static final Log log = LogFactory.getLog(ScoreApplicarion.class);

	public static void main(String[] args) {
		log.info("MSA DEBUG: main "+args.toString());
		log.debug("MSA DEBUG: main "+args.toString());
		log.error("MSA DEBUG: main "+args.toString());

		SpringApplication.run(ScoreApplicarion.class, args);
	}
}
