package msa.harj.sbsecurity.controller;

import java.security.Principal;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import msa.harj.sbsecurity.dao.AppUserDAO;
import msa.harj.sbsecurity.dao.UserRoleDAO;
import msa.harj.sbsecurity.model.AppUser;
import msa.harj.sbsecurity.model.NewUser;
import msa.harj.sbsecurity.model.UserRole;
import msa.harj.sbsecurity.utils.WebUtils;

@Controller
public class MainController {
	private static final Log log = LogFactory.getLog(MainController.class);
	
	@Autowired
	private AppUserDAO appUserDAO;

	@Autowired
	private UserRoleDAO userRoleDAO;
	
//	@Autowired
//	private AppRoleDAO appRoleDAO;

	@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	public String welcomePage(Model model) {
		log.info("/ ja /welcome: "+model.toString());

		model.addAttribute("title", "Welcome");
		model.addAttribute("message", "This is welcome page!");
		return "welcomePage";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(Model model, Principal principal) {

		User loginedUser = (User) ((Authentication) principal).getPrincipal();

		String userInfo = WebUtils.toString(loginedUser);
		model.addAttribute("userInfo", userInfo);

		return "adminPage";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(Model model) {
		log.info("/login: "+model.toString());

		return "loginPage";
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newUserPage(Model model) {
		NewUser user = new NewUser("","","2");
		model.addAttribute("user", user);
		if (model.containsAttribute("user")) {
			log.info("Model.user:"+user);
		} else {
			log.info("Modelissa ei ole \"user\":ia!");
		}
		return "newUserPage";
	}
	
	@RequestMapping(value = "/addnew", method = RequestMethod.POST)
	public String addNewUser(Model model, NewUser newUser, Principal principal) {
		if (model.containsAttribute("newUser")) {
			log.info("Modelissa on newUser");
			log.info(model.toString());
			log.info("Model.newUser:"+newUser);
		} else {
			log.info("Modelissa ei ole \"newUser\":ia!");
		}
		if (model.containsAttribute("user")) {
			log.info("Modelissa on user");
		} else {
			log.info("Modelissa ei ole \"user\":ia!");
		}		
		// nykyinen käyttäjä: log.info("DEBUG: principal = "+principal.getName()+" : "+principal.toString());

		if (!newUser.isPasswordOk()) {
			String message = "<br> Salasanat eivät ole samoja <br> give password again";
			model.addAttribute("message", message);
			model.addAttribute("user", newUser);
			return "newUserPage";
		}
		newUser.encrytePassword(); // poistaa samalla näkyvät salasanat
		
		log.info("Uusi username: " + newUser.getUsername()+" / " + newUser.getEncrytedPassword());
		String userInfo ="";
		appUserDAO.addNewUserAccount(newUser); 
		AppUser appUser = appUserDAO.findUserAccount(newUser.getUsername()); //kantaan talletettu id
		UserRole userRole = new UserRole(appUser.getUserId(), 2L);
		// TODO: nyt lisää vain käyttäjä -rooleja, vaihda samalla userRole muutuja välitettäväksi
		try {
			userRoleDAO.addNewUserRole(userRole);
		} catch (Exception e) {
			userInfo = "Käyttäjälle " + newUser.getUsername() + " ei voi lisätä roolia " + "2";
		}
		model.addAttribute("userInfo", userInfo);

		return "userInfoPage";
	}

	@RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
	public String logoutSuccessfulPage(Model model) {
		model.addAttribute("title", "Logout");
		return "logoutSuccessfulPage";
	}

	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String userInfo(Model model, Principal principal) {
		// After user login successfully.
		String username = principal.getName();

		log.info("MSA: userInfo löysi käyttäjän User Name: " + username);

		User loginedUser = (User) ((Authentication) principal).getPrincipal();

		String userInfo = WebUtils.toString(loginedUser);
		model.addAttribute("userInfo", userInfo);

		return "userInfoPage";
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessDenied(Model model, Principal principal) {

		if (principal != null) {
			User loginedUser = (User) ((Authentication) principal).getPrincipal();

			String userInfo = WebUtils.toString(loginedUser);

			model.addAttribute("userInfo", userInfo);

			String message = "Hi " + principal.getName() //
					+ "<br> Sulla ei oo oikeuksia tälle sivulle! <br> You do not have permission to access this page!";
			model.addAttribute("message", message);

		}

		return "403Page";
	}

}
