package msa.harj.score.controller;

import java.security.Principal;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import msa.harj.score.utils.WebUtils;

@Controller
public class AdminController {
	private static final Log log = LogFactory.getLog(AdminController.class);
	
	@GetMapping("/admin")
	public String adminPage(Model model, Principal principal) {

		User loginedUser = (User) ((Authentication) principal).getPrincipal();

		String userInfo = WebUtils.toString(loginedUser);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("title", "Vain admin -oikeudet omaaville käyttäjille");

		return "adminPage";
	}

	@GetMapping("/admin/kierrokset")
	public String adminKierrokset(Model model, Principal principal) {
		User loginedUser = (User) ((Authentication) principal).getPrincipal();

		String userInfo = WebUtils.toString(loginedUser);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("title", "Varaus Admin kierroksille: vielä suunnittelematta ja toteuttamatta.");

		return "adminPage";
	}

}
