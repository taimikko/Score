package org.o7planning.sbsecurity.controller;

import java.security.Principal;

import org.o7planning.sbsecurity.dao.AppRoleDAO;
import org.o7planning.sbsecurity.dao.AppUserDAO;
import org.o7planning.sbsecurity.dao.UserRoleDAO;
import org.o7planning.sbsecurity.model.AppUser;
import org.o7planning.sbsecurity.model.NewUser;
import org.o7planning.sbsecurity.model.UserRole;
import org.o7planning.sbsecurity.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@Autowired
	private AppUserDAO appUserDAO;

	@Autowired
	private UserRoleDAO userRoleDAO;
	
	@Autowired
	private AppRoleDAO appRoleDAO;

	@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	public String welcomePage(Model model) {
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

		return "loginPage";
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newUserPage(Model model) {
		NewUser user = new NewUser("dummyuser_a","a","2");
		model.addAttribute("user", user);
		if (model.containsAttribute("user")) {
			System.out.println("Model.user:"+user);
		} else {
			System.out.println("Modelissa ei ole \"user\":ia!");
		}
		return "newUserPage";
	}
	
	@RequestMapping(value = "/addnew", method = RequestMethod.POST)
	public String addNewUser(Model model, NewUser newUser, Principal principal) {
		if (model.containsAttribute("newUser")) {
			System.out.println("Modelissa on newUser");
			System.out.println(model.toString());
			System.out.println("Model.newUser:"+newUser);
		} else {
			System.out.println("Modelissa ei ole \"newUser\":ia!");
		}
		if (model.containsAttribute("user")) {
			System.out.println("Modelissa on user");
		} else {
			System.out.println("Modelissa ei ole \"user\":ia!");
		}		
		// nykyinen käyttäjä: System.out.println("DEBUG: principal = "+principal.getName()+" : "+principal.toString());

		if (!newUser.isPasswordOk()) {
			String message = "<br> Salasanat eivät ole samoja <br> give password again";
			model.addAttribute("message", message);
			model.addAttribute("user", newUser);
			return "newUserPage";
		}
		newUser.encrytePassword(); // poistaa samalla näkyvät salasanat
		
		System.out.println("Uusi Username: " + newUser.getUserName()+" / " + newUser.getEncrytedPassword());
		String userInfo ="";
		appUserDAO.addNewUserAccount(newUser); 
		AppUser appUser = appUserDAO.findUserAccount(newUser.getUserName()); //kantaan talletettu id
		UserRole userRole = new UserRole(appUser.getUserId(), 2L);
		// TODO: nyt lisää vain käyttäjä -rooleja, vaihda samalla userRole muutuja välitettäväksi
		try {
			userRoleDAO.addNewUserRole(userRole);
		} catch (Exception e) {
			userInfo = "Käyttäjälle " + newUser.getUserName() + " enewUsert lisätä roolia " + "2";
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
		String userName = principal.getName();

		System.out.println("User Name: " + userName);

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
