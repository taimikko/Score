package msa.harj.sbsecurity.config;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
//import msa.harj.sbsecurity.service.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
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

	/* TESTIÄ */

	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		log.info("MSA DEBUG: configAuthentication:");

		String authoritiesSql = "SELECT u.user_name, r.role_name " //
				+ " FROM user_role ur, app_role r, app_user u " //
				+ " WHERE ur.role_id = r.role_id AND ur.user_id = u.user_id AND u.user_name = ? ";

		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder())
				.usersByUsernameQuery("SELECT user_name, encryted_password, enabled FROM app_user WHERE user_name=?")
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
		log.debug("MSA DEBUG: WebSecurityConfig.configure "+http.toString());
		log.error("MSA DEBUG: WebSecurityConfig.configure "+http.toString());

		http.csrf().disable();

        //if (securityProperties.isRequireSsl()) http.requiresChannel().anyRequest().requiresSecure(); // MSA

		// The pages does not require login
		http.authorizeRequests().antMatchers("/", "/login", "/logout").permitAll();

		// /userInfo page requires login as ROLE_USER or ROLE_ADMIN.
		// If no login, it will redirect to /login page.
		http.authorizeRequests().antMatchers("/userInfo").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");
		http.authorizeRequests().antMatchers("/error", "/users").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')"); // MSA

		// For ADMIN only.
		http.authorizeRequests().antMatchers("/admin").access("hasRole('ROLE_ADMIN')");
		http.authorizeRequests().antMatchers("/new").access("hasRole('ROLE_ADMIN')");

		http.authorizeRequests().antMatchers("/addnew").access("hasRole('ROLE_ADMIN')");
		// When the user has logged in as XX.
		// But access a page that requires role YY,
		// AccessDeniedException will be thrown.
		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");

		// Config for Login Form
		http.authorizeRequests().and().formLogin()//
				// Submit URL of login page.
				.loginProcessingUrl("/j_spring_security_check") // Submit URL
				.loginPage("/login")//
				.defaultSuccessUrl("/userAccountInfo")//
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
