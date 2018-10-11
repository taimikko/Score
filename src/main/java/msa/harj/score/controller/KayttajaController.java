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
import org.springframework.web.bind.annotation.PostMapping;

import msa.harj.score.dao.KayttajaDAO;
import msa.harj.score.dao.KayttajaRooliDAO;
import msa.harj.score.dao.RooliDAO;
import msa.harj.score.model.Kayttaja;
import msa.harj.score.model.KayttajaRooli;
import msa.harj.score.model.UusiKayttaja;
import msa.harj.score.utils.WebUtils;

@Controller
public class KayttajaController {
	private static final Log log = LogFactory.getLog(KayttajaController.class);

	@Autowired
	private KayttajaDAO kayttajaDAO;

	@Autowired
	private KayttajaRooliDAO kRooliDAO;
	
	@Autowired 
	private RooliDAO rooliDAO;

	@GetMapping("/kayttaja/new")
	public String newKayttaja(Model model) {
		log.info("MSA: /kayttaja/new");
		UusiKayttaja k = new UusiKayttaja("", "");
		model.addAttribute("kayttaja", k);
		return "kayttaja/kayttajaNew";
	}

	@PostMapping("/kayttaja/add")
	public String addKayttaja(Model model, UusiKayttaja newUser, Principal principal) {
		log.info("MSA: /kayttaja/add");
		if (model.containsAttribute("newUser")) {
			log.info("Modelissa on newUser");
			log.info(model.toString());
			log.info("Model.newUser:" + newUser);
		} else {
			log.info("Modelissa ei ole \"newUser\":ia!");
		}

		if (!newUser.isPasswordOk()) {
			String message = "<br> Salasanat eivät ole samoja <br> give password again";
			model.addAttribute("message", message);
			model.addAttribute("user", newUser);
			return "kayttaja/kayttajaNew";
		}
		newUser.encrytePassword(); // poistaa samalla näkyvät salasanat

		log.info("Uusi username: " + newUser.getUsername() + " / " + newUser.getEncrytedPassword());
		String userInfo = "";
		kayttajaDAO.addNewUserAccount(newUser);
		Kayttaja appUser = kayttajaDAO.getKayttaja(newUser.getUsername()); // kantaan talletettu id
		KayttajaRooli userRole = new KayttajaRooli(appUser.getKayttajaId(), 3L);
		// TODO: nyt lisää vain käyttäjä -rooleja, vaihda samalla userRole muutuja
		// välitettäväksi
		try {
			kRooliDAO.addKayttajaRooli(userRole);
		} catch (Exception e) {
			userInfo = "Käyttäjälle " + newUser.getUsername() + " ei voi lisätä roolia 3";
		}
		model.addAttribute("userInfo", userInfo);

		return "kayttaja/kayttajaInfo";
	}

	@GetMapping("/kayttajaluettelo")
	public String kayttajaLista(Model model) {
		log.info("MSA: /kayttajaluettelo");
		Long seura = 78L;
		List<Kayttaja> k = kayttajaDAO.getKayttajat(seura);
		model.addAttribute("kayttajat", k);
		String str = "";
		for (Kayttaja kayttaja : k) {
			str += kayttaja.toString() + "\t";
		}
		log.info("userList palauttaa(" + Integer.toString(k.size()) + "):" + str);
		return "kayttaja/kayttajaLista";
	}

	@GetMapping("/kayttajaInfo")
	public String userInfo(Model model, Principal principal) {
		// After user login successfully.
		String username = principal.getName();

		log.info("MSA: /kayttajaInfo User Name: " + username);

		User loginedUser = (User) ((Authentication) principal).getPrincipal();

		String userInfo = WebUtils.toString(loginedUser);
		model.addAttribute("userInfo", userInfo);

		return "kayttaja/kayttajaInfo";
	}

	@GetMapping("/kayttaja/{kayttajatunnus}")
	public String kayttajaTiedot(Model model, Principal principal, @PathVariable("kayttajatunnus") String kayttajatunnus) {
		log.info("MSA: /kayttaja/" + kayttajatunnus);
		Kayttaja k = kayttajaDAO.getKayttaja(kayttajatunnus);
		model.addAttribute("kayttaja", k);
		
		List<String> roolit = rooliDAO.getRoleNames(k.getKayttajaId()); 
		model.addAttribute("roolit", roolit);
		
		return "kayttaja/kayttajaTiedot";
	}

}
