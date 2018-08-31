package org.o7planning.sbsecurity.controller;

import java.security.Principal;

import org.o7planning.sbsecurity.dao.AppUserDAO;
import org.o7planning.sbsecurity.dao.UserRoleDAO;
import org.o7planning.sbsecurity.model.AppUser;
import org.o7planning.sbsecurity.model.NewUser;
import org.o7planning.sbsecurity.utils.EncrytedPasswordUtils;
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

		return "newUserPage";
	}
	
	@RequestMapping(value = "/addnew", method = RequestMethod.POST)
	public String addNewUser(Model model, NewUser usr, Principal principal) {
		
		if (!usr.passwordOk()) {
			String message = "<br> Salasanat eivät ole samoja <br> give password again";
			model.addAttribute("message", message);
			return "newUserPage";
		}
		
		String userName = usr.getUserName();
		String pwd = usr.getPassword();
		String encrytedPwd = EncrytedPasswordUtils.encrytePassword(pwd);

		System.out.println("Uusi Username: " + userName +" / " + encrytedPwd);
		
		appUserDAO.addNewUserAccount(usr); 
		AppUser user = appUserDAO.findUserAccount(usr.getUserName()); // saadaan kantaan talletettu id
		userRoleDAO.addNewUserRole(user.getUserId(), 2);

//		User loginedUser = (User) ((Authentication) principal).getPrincipal();
//
//		String userInfo = WebUtils.toString(loginedUser);
//		model.addAttribute("userInfo", userInfo);

		return "userInfoPage";
	}

	@RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
	public String logoutSuccessfulPage(Model model) {
		model.addAttribute("title", "Logout");
		return "logoutSuccessfulPage";
	}

	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String userInfo(Model model, Principal principal) {

		// (1) (en)
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
