package msa.harj.score;

import static java.util.Collections.singletonList;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

@SpringBootApplication
public class ScoreApplication {
	private static final Log log = LogFactory.getLog(ScoreApplication.class);

	public ScoreApplication(FreeMarkerConfigurer freeMarkerConfigurer) {
		freeMarkerConfigurer.getTaglibFactory().setClasspathTlds(singletonList("/META-INF/security.tld"));
	}

	public static void main(String[] args) {
		log.info("MSA: main " + args.toString());
		SpringApplication.run(ScoreApplication.class, args);
	}

}
