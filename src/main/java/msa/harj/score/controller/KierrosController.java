package msa.harj.score.controller;

import java.security.Principal;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import msa.harj.score.dao.KierrosDAO;
import msa.harj.score.dao.PelaajaDAO;

@Controller
public class KierrosController {
	private static final Log log = LogFactory.getLog(KierrosController.class);

	@Autowired
	private PelaajaDAO pelaajaDAO;

	@Autowired
	private KierrosDAO kierrosDAO;

	@GetMapping("/kierros/add")
	public String addKierros(Model model) {
		log.info("MSA: /kierros/add");
		return "kierros/kierrosEdit"; // TODO
	}

	@PostMapping("/kierros/add")
	public String addKierros(Model model, Kierros k) {
		log.info("MSA(post) /kierros/add " + k.getPelaaja());
		model.addAttribute("kierros", k);
		try {
			kierrosDAO.addKierros(k);
			return "redirect:/kierrokset";
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage()); // return "/error";
			return "kierros/kierrosAdd";
		}
	}

	@GetMapping("/kierros/get/{kierrosId}")
	public String getKierros(Model model, @PathVariable("kierrosId") Long kierrosId) {
		// TODO: yksittäinen kierros keneltä tahansa
	}

	@GetMapping("/kierros/edit/{kierrosId}")
	public String editKierros(Model model, @PathVariable("kierrosId") Long kierrosId, Principal principal) {
		// TODO: yksittäinen oma kierros keneltä tahansa
	}

	@PostMapping("/kierros/edit")
	public String editKierros(Model model, Kierros kierros, Principal principal) {
		// TODO: yksittäinen oma kierros keneltä tahansa
	}

	@GetMapping("/kierros/omat")
	public String getOmatKierrokset(Model model, Principal principal) {
		// TODO: kaikki omat kierrokset (vuodelta/kentältä ??)
	}

	@GetMapping("/kierros/pelaaja/{pelaajaId}")
	public String getPelaajanKierrokset(Model model, @PathVariable("pelaajaId") Long pelaajaId) {
		// TODO: kaikki ko. pelaajan kierrokset (vuodelta/kentältä ??)
	}

	@DeleteMapping("/kierros")
	public String deleteKierros(Model model, Kierros kierros) {
		// TODO:
	}
}
