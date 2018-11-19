package msa.harj.score.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
			@RequestParam(value = "kentta_id", required = false) Long kentta_id,
			@RequestParam(value = "jasennumero", required = false) Long jasennumero,
			@RequestParam(value = "etunimi", required = false) String etunimi, 
			@RequestParam(value = "sukunimi", required = false) String sukunimi,
			@RequestParam(value = "seura", required = false) Long seura, 
			@RequestParam(value = "tasoituskierros", required = false) Boolean tasoituskierros, 
			@RequestParam(value = "alkupvm", required = false) 	@DateTimeFormat(pattern = "yyyy-MM-dd") Date alkupvm, 
			@RequestParam(value = "loppupvm", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date loppupvm, 
			@RequestParam(value = "pisteet", required = false) Long pisteet	) {
		String rajaus = "";
		if (kentta_id != null) {
			rajaus += ((rajaus!="") ? ", ": "") + "kenttä = " + Long.toString(kentta_id);
		};
		if (jasennumero != null) {
			rajaus += ((rajaus!="") ? ", ": "") + "jäsennumero = " + Long.toString(jasennumero);
		};
		if (etunimi != null) {
			rajaus += ((rajaus!="") ? ", ": "") + "etunimi = '" + etunimi+"'";
		};
		if (sukunimi != null) {
			rajaus += ((rajaus!="") ? ", ": "") + "sukunimi = '" + sukunimi+"'";
		};
		if (seura != null) {
			rajaus += ((rajaus!="") ? ", ": "") + "seura = " + Long.toString(seura);
		};
		if (tasoituskierros != null) {
			rajaus += ((rajaus!="") ? ", ": "") + (tasoituskierros ? "tasoituskierros" : "harjoituskierros");
		};
		DateFormat df = new SimpleDateFormat("dd.MM.yyyy", Locale.getDefault());
		if (alkupvm != null) {
			rajaus += ((rajaus!="") ? ", ": "") + "pvm >= " + df.format(alkupvm); 
		};
		
		if (loppupvm != null) {
			rajaus += ((rajaus!="") ? ", ": "") + "pvm <= " + df.format(loppupvm);
		};
		
		if (pisteet != null) {
			rajaus += ((rajaus!="") ? ", ": "") + "pisteet = " + Long.toString(pisteet); // TODO: min pisteet ?
		};
//		Id	Pvm	Tii	Lyönnit	9/18	Lisätieto


		log.info("MSA: /admin/kierrokset "+alkupvm+" "+loppupvm );
		List<Kierros> kierrokset = kierrosDAO.getKentanKierrokset(kentta_id, jasennumero, etunimi, sukunimi, seura, tasoituskierros, pisteet, alkupvm, loppupvm);
		model.addAttribute("kierrokset", kierrokset);
		model.addAttribute("rajaus", rajaus);

		return "kierros/kierrosLuettelo";
	}

}
