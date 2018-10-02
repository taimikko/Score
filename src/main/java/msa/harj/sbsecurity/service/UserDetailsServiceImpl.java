package msa.harj.sbsecurity.service;
/*
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import msa.harj.sbsecurity.dao.AppRoleDAO;
import msa.harj.sbsecurity.dao.AppUserDAO;
import msa.harj.sbsecurity.model.AppUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	private static final Log log = LogFactory.getLog(UserDetailsServiceImpl.class);

	@Autowired
	private AppUserDAO appUserDAO;

	@Autowired
	private AppRoleDAO appRoleDAO;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("MSA DEBUG: UserDetails sai parametrina käyttäjätunnuksen '"+username+"'");
		
		AppUser appUser = this.appUserDAO.findUserAccount(username);

		if (appUser == null) {
			log.info("User "+username+" not found!");
			throw new UsernameNotFoundException("User " + username + " was not found in the database");
		}

		log.info("MSA DEBUG: Found User:'" + appUser+"'");

		// [ROLE_USER, ROLE_ADMIN,..]
		List<String> roleNames = this.appRoleDAO.getRoleNames(appUser.getUserId());

		List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
		if (roleNames != null) {
			for (String role : roleNames) {
				// ROLE_USER, ROLE_ADMIN,..
				GrantedAuthority authority = new SimpleGrantedAuthority(role);
				grantList.add(authority);
			}
		}

		UserDetails userDetails = (UserDetails) new User(appUser.getusername(), //
				appUser.getEncrytedPassword(), grantList);

		return userDetails;
	}

}
*/