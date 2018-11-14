package msa.harj.score.controller;

import java.security.Principal;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import msa.harj.score.dao.KayttajaDAO;
import msa.harj.score.dao.KenttaDAO;
import msa.harj.score.dao.PelaajaDAO;
import msa.harj.score.dao.RooliDAO;
import msa.harj.score.model.Kayttaja;
import msa.harj.score.model.Kentta;
import msa.harj.score.model.Pelaaja;
import msa.harj.score.utils.WebUtils;

@Controller
public class PelaajaController {
	private static final Log log = LogFactory.getLog(PelaajaController.class);

	@Autowired
	private PelaajaDAO pelaajaDAO;

	@Autowired
	private RooliDAO rooliDAO;

	@Autowired
	private KenttaDAO kenttaDAO;

	@Autowired
	private KayttajaDAO kayttajaDAO;

	@GetMapping("/pelaaja/{seuraId}/{jasennumero}")
	public String getPelaaja(Model model, @PathVariable("seuraId") Long seuraId,
			@PathVariable("jasennumero") Long jasennumero) {
		log.info("MSA: /pelaaja/" + Long.toString(seuraId) + "/" + Long.toString(jasennumero));
		Pelaaja p = pelaajaDAO.getPelaaja(seuraId, jasennumero);
		model.addAttribute("pelaaja", p);
		log.info("MSA: pelaajan.käyttäjäid:" + Long.toString(p.getKayttajaId()) + "\t" + p);

		List<String> roolit = rooliDAO.getRoleNames(p.getKayttajaId());
		model.addAttribute("roolit", roolit);

		return "pelaaja/pelaajaTiedot";
	}

	@RequestMapping("/pelaaja/seuranjasenet")
	public @ResponseBody List<Pelaaja> seuranjasenet(
			@RequestParam(value = "seura_id", required = false) Long seura_id) {
		log.info("MSA: /pelaaja/seuranjasenet " + seura_id);
		if (seura_id == null)
			log.info("MSA: seura_id == null");
		List<Pelaaja> pelaajat = pelaajaDAO.getSeuranPelaajat(seura_id);
		log.info("MSA: seuranjasenet " + pelaajat);
		return pelaajat;
	}

	@GetMapping("/pelaaja/get/{pelaajaId}")
	public String getPelaaja(Model model, @PathVariable("pelaajaId") Long pelaajaId) {
		log.info("MSA: /pelaaja/get/" + Long.toString(pelaajaId));
		Pelaaja p = pelaajaDAO.getPelaaja(pelaajaId);
		model.addAttribute("pelaaja", p);
		return "pelaaja/pelaajaTiedot"; // TODO
	}

	@PostMapping("/pelaaja/del/{pelaajaId}")
	public String deletePelaaja(Model model, @PathVariable("pelaajaId") Long pelaajaId) {
		log.info("MSA: /pelaaja/del/" + Long.toString(pelaajaId));
		Pelaaja p = pelaajaDAO.getPelaaja(pelaajaId);
		pelaajaDAO.deletePelaaja(pelaajaId); // Toimii
		List<Pelaaja> ph = pelaajaDAO.getPelaajaHistoria(p.getSeuraId(), p.getJasennumero());
		model.addAttribute("pelaajat", ph);
		Kayttaja k = (Kayttaja) ph.get(0);
		model.addAttribute("kayttaja", k);
		return "pelaaja/pelaajaHistoria";
	}

	@GetMapping("/pelaaja/history/{seuraId}/{jasennumero}")
	public String pelaajaHistoria(Model model, Principal principal, SecurityContextHolderAwareRequestWrapper request,
			@PathVariable("seuraId") Long seuraId, @PathVariable("jasennumero") Long jasennumero) {
		log.info("MSA: /pelaaja/history/" + Long.toString(seuraId) + "/" + Long.toString(jasennumero));
		Kayttaja k = kayttajaDAO.getKayttaja(principal.getName());
		
		if ((k.getSeuraId().equals(seuraId) && k.getJasennumero().equals(jasennumero))
				|| request.isUserInRole("ROLE_ADMIN")) {
			List<Pelaaja> ph = pelaajaDAO.getPelaajaHistoria(seuraId, jasennumero);
			model.addAttribute("pelaajat", ph);
			model.addAttribute("kayttaja", k);

//			String str = "";
//			for (Pelaaja p : ph) {
//				str += p.toString() + "\t";
//			}
//			log.info("pelaajaHistoria palauttaa(" + Integer.toString(ph.size()) + "):" + str);

			return "pelaaja/pelaajaHistoria";
		} else {
			if (principal != null) {
				User loginedUser = (User) ((Authentication) principal).getPrincipal();
				String userInfo = WebUtils.toString(loginedUser);
				model.addAttribute("userInfo", userInfo);
			}
			model.addAttribute("message", "Voit katsoa vain omia tietojasi. "+k.getSeuraId()+"/"+k.getJasennumero());
			return "403Page";
		}
	}

	@GetMapping("/pelaaja/edit/{pelaajaId}")
	public String editPelaaja(Model model, @PathVariable("pelaajaId") Long pelaajaId) {
		log.info("MSA(get): /pelaaja/edit/" + pelaajaId);
		Pelaaja p = pelaajaDAO.getPelaaja(pelaajaId);
		model.addAttribute("pelaaja", p);
		return "pelaaja/pelaajaEdit"; // TODO
	}

	@PostMapping("/pelaaja/edit")
	public String updatePelaaja(Model model, Pelaaja p) {
		log.info("MSA(post): /pelaaja/edit/" + p.getUsername() + " " + p.getSeuraId() + ":" + p.getJasennumero());
		try {
			pelaajaDAO.updatePelaaja(p);
			// model.addAttribute("pelaaja", p);
			return "redirect:/pelaaja/" + p.getSeuraId() + "/" + p.getJasennumero();
			// return "redirect:/pelaajat"; // TODO
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "/pelaaja/edit/" + p.getId();
		}
	}

	@GetMapping("/pelaaja/add")
	public String addPelaaja(Model model) {
		log.info("MSA: /pelaaja/add");
		return "pelaaja/pelaajaEdit"; // TODO
	}

	@PostMapping("/pelaaja/add")
	public String addPelaaja(Model model, Pelaaja p) {
		log.info("MSA(post) /pelaaja/add " + p.getUsername() + ": " + p.getEtunimi() + " " + p.getSukunimi() + ")");
		model.addAttribute("pelaaja", p);
		try {
			pelaajaDAO.addPelaaja(p);
			return "redirect:/pelaajat";
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage()); // return "/error";
			return "pelaaja/pelaajaAdd";
		}

	}

	@GetMapping("/pelaaja/kotikentta")
	public @ResponseBody Kentta haeKotikentta(@RequestParam(value = "seura_id") Long seura_id) {
		log.info("MSA: /pelaaja/kotikentta " + seura_id);
		if (seura_id == null) {
			log.info("MSA: seura_id == null");
			return null;
		}
		return kenttaDAO.getKotikentta(seura_id);
	}

}
