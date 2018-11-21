package msa.harj.score.config;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
//import msa.harj.score.service.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	private static final Log log = LogFactory.getLog(WebSecurityConfig.class);

//	@Autowired
// UserDetailsServiceImpl userDetailsService;

	@Autowired
	DataSource dataSource;

    //@Inject private SecurityProperties securityProperties; // MSa
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		log.info("MSA DEBUG: passwordEncoder");
		return bCryptPasswordEncoder;
	}

	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		log.info("MSA DEBUG: configAuthentication:");

		String authoritiesSql = "SELECT k.kayttajatunnus, r.rooli_nimi " //
				+ " FROM kayttaja_rooli kr, rooli r, kayttaja k " //
				+ " WHERE kr.rooli_id = r.rooli_id AND kr.kayttaja_id = k.kayttaja_id AND k.kayttajatunnus = ? ";

		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder())
				.usersByUsernameQuery("SELECT kayttajatunnus, encryted_password, enabled FROM kayttaja WHERE kayttajatunnus=?")
				.authoritiesByUsernameQuery(authoritiesSql);
	}
	
    /* TESTIÄ
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {

		// Setting Service to find User in the database.
		// And Setting PassswordEncoder
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}
    TESTIÄ */
	
	/*
	TomcatEmbeddedServletContainerFactory tomcat = new TomcatEmbeddedServletContainerFactory() {
	    @Override
	    protected void postProcessContext(Context context) {
	        SecurityConstraint securityConstraint = new SecurityConstraint();
	        securityConstraint.setUserConstraint("CONFIDENTIAL");
	        SecurityCollection collection = new SecurityCollection();
	        collection.addPattern("/*");
	        securityConstraint.addCollection(collection);
	        context.addConstraint(securityConstraint);
	    }
	}; */
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		log.info("MSA DEBUG: WebSecurityConfig.configure "+http.toString());

		http.csrf().disable();

        //if (securityProperties.isRequireSsl()) http.requiresChannel().anyRequest().requiresSecure(); // MSA

		// The pages does not require login
		http.authorizeRequests().antMatchers("/", "/login", "/logout", "index", "/nakkivene").permitAll();
		http.authorizeRequests().antMatchers("/kierros", "/kierros/*").access("hasAnyRole('ROLE_PELAAJA', 'ROLE_ADMIN')");
		http.authorizeRequests().antMatchers("/pelaaja/kotikentta").access("hasAnyRole('ROLE_PELAAJA')");
		
		http.authorizeRequests().antMatchers(HttpMethod.GET, "/kentta/**", "/admin/kentat").access("hasAnyRole('ROLE_PELAAJA')");
		http.authorizeRequests().antMatchers(HttpMethod.GET, "/pelaaja/seuranjasenet").access("hasAnyRole('ROLE_PELAAJA')");
		http.authorizeRequests().antMatchers(HttpMethod.GET, "/pelaaja/get/*").access("hasAnyRole('ROLE_PELAAJA')");

		// TODO: voiko asettaa oikeudet vain omiin tietoihin ? */seura/jasennumero
		http.authorizeRequests().antMatchers(HttpMethod.GET, "/pelaaja/history/*/*").access("hasAnyRole('ROLE_PELAAJA')");
		
		// /userInfo page requires login as ROLE_PELAAJA or ROLE_ADMIN.
		// If no login, it will redirect to /login page.
		http.authorizeRequests().antMatchers("/kayttajaInfo").access("hasAnyRole('ROLE_PELAAJA', 'ROLE_ADMIN')");
		http.authorizeRequests().antMatchers("/error", "/users").access("hasAnyRole('ROLE_PELAAJA', 'ROLE_ADMIN')"); // MSA

		http.authorizeRequests().antMatchers("/kayttajaTiedot").access("hasAnyRole('ROLE_SEURA_MANAGER', 'ROLE_ADMIN')");

		// For ADMIN only.
		http.authorizeRequests().antMatchers("/seura/**").access("hasRole('ROLE_ADMIN')");
		http.authorizeRequests().antMatchers("/admin", "/admin/**").access("hasRole('ROLE_ADMIN')");
		http.authorizeRequests().antMatchers("/kentta", "/kentta/**").access("hasRole('ROLE_ADMIN')");
		
		http.authorizeRequests().antMatchers("/kayttaja/**").access("hasAnyRole('ROLE_ADMIN', 'ROLE_SEURA_MANAGER')");
		http.authorizeRequests().antMatchers("/pelaaja/**").access("hasAnyRole('ROLE_ADMIN', 'ROLE_SEURA_MANAGER')");
		
		http.authorizeRequests().antMatchers("kayttajaLista", "/kayttajaluettelo").access("hasAnyRole('ROLE_ADMIN', 'ROLE_SEURA_MANAGER')");
		// When the user has logged in as XX.
		// But access a page that requires role YY,
		// AccessDeniedException will be thrown.
		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");

		// Config for Login Form
		http.authorizeRequests().and().formLogin()//
				// Submit URL of login page.
				.loginProcessingUrl("/j_spring_security_check") // Submit URL
				.loginPage("/login")//
				.defaultSuccessUrl("/")//
				.failureUrl("/login?error=true")//
				.usernameParameter("username")//
				.passwordParameter("password")
				// Config for Logout Page
				.and().logout().logoutUrl("/logout").logoutSuccessUrl("/logoutSuccessful");

	/*
    http.authorizeRequests()
      .antMatchers("/login*")
      .permitAll();
 
    http.authorizeRequests()
      .anyRequest()
      .authenticated();
	 */

	}
}


