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
import org.springframework.web.bind.annotation.RequestParam;

import msa.harj.score.dao.KayttajaDAO;
import msa.harj.score.dao.KenttaDAO;
import msa.harj.score.dao.KierrosDAO;
import msa.harj.score.dao.SeuraDAO;
import msa.harj.score.model.Kayttaja;
import msa.harj.score.model.Kentta;
import msa.harj.score.model.Kierros;
import msa.harj.score.model.Seura;
import msa.harj.score.utils.WebUtils;

@Controller
public class AdminController {
	private static final Log log = LogFactory.getLog(AdminController.class);

	@Autowired
	private KenttaDAO kenttaDAO;

	@Autowired
	private KierrosDAO kierrosDAO;

	@Autowired
	private KayttajaDAO kayttajaDAO;

	@Autowired
	private SeuraDAO seuraDAO;

	@GetMapping("/admin")
	public String adminPage(Model model, Principal principal) {
		User loginedUser = (User) ((Authentication) principal).getPrincipal();
		String userInfo = WebUtils.toString(loginedUser);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("title", "Vain admin -oikeudet omaaville käyttäjille");
		String username = principal.getName();
		Kayttaja admin = kayttajaDAO.getKayttaja(username);
		List<Kentta> kentat = kenttaDAO.getSeuranKentat(admin.getSeuraId());
		Long kentta_id = kentat.get(0).getId();
		model.addAttribute("kentta_id", kentta_id); // oletusarvo
		kentat = kenttaDAO.getKentat();
		model.addAttribute("kentat", kentat);
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);
		Long seura_id = admin.getSeuraId();
		model.addAttribute("seura_id", seura_id); 
		
		return "adminPage";
	}

	@GetMapping("/admin/kentat")
	public String naytaKentat(Model model) {
		List<Kentta> kentat = kenttaDAO.getKentat();
		model.addAttribute("kentat", kentat);

		return "kentta/kenttaLista";

	}

	@GetMapping("/admin/kierrokset")
	public String adminKaikkiKierrokset(Model model,
			@RequestParam(value = "kentta_id", required = false) Long kentta_id) {
		String rajaus = "";
		if (kentta_id != null) {
			rajaus = "kenttä = " + Long.toString(kentta_id);
		};
		log.info("MSA: /admin/kierrokset " );
		List<Kierros> kierrokset = kierrosDAO.getKentanKierrokset(kentta_id);
		model.addAttribute("kierrokset", kierrokset);
		model.addAttribute("rajaus", rajaus);

		return "kierros/kierrosLuettelo";
	}

}
