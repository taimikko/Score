package msa.harj.score.controller;

import java.security.Principal;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import msa.harj.score.dao.KenttaDAO;
import msa.harj.score.dao.KierrosDAO;
import msa.harj.score.model.Kentta;
import msa.harj.score.model.Kierros;
import msa.harj.score.utils.WebUtils;

@Controller
public class AdminController {
	private static final Log log = LogFactory.getLog(AdminController.class);

	@Autowired
	private KenttaDAO kenttaDAO;

	@Autowired
	private KierrosDAO kierrosDAO;

	@GetMapping("/admin")
	public String adminPage(Model model, Principal principal) {

		User loginedUser = (User) ((Authentication) principal).getPrincipal();

		String userInfo = WebUtils.toString(loginedUser);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("title", "Vain admin -oikeudet omaaville käyttäjille");

		return "adminPage";
	}

	@GetMapping("/admin/kentat")
	public String naytaKentat(Model model) {
		List<Kentta> kentat = kenttaDAO.getKentat();
		model.addAttribute("kentat", kentat);

		return "kentta/kenttaLista";

	}
	
	@GetMapping("/admin/kierrokset/{seuraId}")
	public String adminSeuraKierrokset(Model model, @PathVariable("seuraId") Long seuraId) {
		List<Kierros> kierrokset = kierrosDAO.getSeuraKierrokset(seuraId); 
		model.addAttribute("kierrokset", kierrokset);

		return "kierros/kierrosLuettelo";
	}

	@GetMapping("/admin/kierrokset")
	public String adminKaikkiKierrokset(Model model) {
		List<Kierros> kierrokset = kierrosDAO.getSeuraKierrokset(0L); 
		model.addAttribute("kierrokset", kierrokset);

		return "kierros/kierrosLuettelo";
	}

}
