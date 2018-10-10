package msa.harj.score.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import msa.harj.score.dao.PelaajaDAO;
import msa.harj.score.model.Pelaaja;

@Controller
public class PelaajaController {
	private static final Log log = LogFactory.getLog(PelaajaController.class);

	@Autowired
	private PelaajaDAO pelaajaDAO;

	@GetMapping("/pelaaja/{seuraId}/{jasennumero}")
	public String getPelaaja(Model model, @PathVariable("seuraId") Long seuraId,
			@PathVariable("jasennumero") Long jasennumero) {
		log.info("MSA: /pelaaja/" + Long.toString(seuraId) + "/" + Long.toString(jasennumero));
		Pelaaja p = pelaajaDAO.getPelaaja(seuraId, jasennumero);
		model.addAttribute("pelaaja", p);
		return "pelaajaInfo";
	}

	@GetMapping("/pelaaja/get/{pelaajaId}")
	public String getPelaaja(Model model, @PathVariable("pelaajaId") Long pelaajaId) {
		log.info("MSA: /pelaaja/get/" + Long.toString(pelaajaId));
		Pelaaja p = pelaajaDAO.getPelaaja(pelaajaId);
		model.addAttribute("pelaaja", p);
		return "pelaajaInfo"; // TODO
	}

	@GetMapping("/pelaaja/del/{pelaajaId}")
	public String deletePelaaja(@PathVariable("pelaajaId") Long pelaajaId) {
		log.info("MSA: /pelaaja/del/" + Long.toString(pelaajaId));
		pelaajaDAO.deletePelaaja(pelaajaId);
		return "redirect:/pelaajat"; // TODO: /pelaajat puuttuu
	}

	@GetMapping("/pelaaja/history/{seuraId}/{jasennumero}")
	public String pelaajaHistoria(Model model, @PathVariable("seuraId") Long seuraId,
			@PathVariable("jasennumero") Long jasennumero) {
		log.info("MSA: /pelaaja/history/" + Long.toString(seuraId) + "/" + Long.toString(jasennumero));
		List<Pelaaja> ph = pelaajaDAO.getPelaajaHistoria(seuraId, jasennumero);
		model.addAttribute("pelaajahistoria", ph);
		String str = "";
		for (Pelaaja p : ph) {
			str += p.toString() + "\t";
		}
		log.info("pelaajaHistoria palauttaa(" + Integer.toString(ph.size()) + "):" + str);
		return "pelaajaHistoria"; // TODO
	}

	@GetMapping("/pelaaja/edit/{username}")
	public String editPelaaja(Model model, @PathVariable("username") String username) {
		log.info("MSA(get): /pelaaja/edit/" + username);
		Pelaaja p = pelaajaDAO.getPelaaja(username);
		model.addAttribute("pelaaja", p);
		return "pelaajaEdit"; // TODO
	}

	@PostMapping("/pelaaja/edit/{username}")
	public String updatePelaaja(Model model, @PathVariable("username") String username, Pelaaja p) {
		log.info("MSA(post): /pelaaja/edit/" + username);

		model.addAttribute("pelaaja", p);
		try {
			pelaajaDAO.updatePelaaja(p);
			return "redirect:/pelaajat"; // TODO
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "/pelaaja/edit/" + p.getUsername();
		}
	}

	@GetMapping("/pelaaja/add")
	public String addPelaaja(Model model) {
		log.info("MSA: /pelaaja/add");
		return "pelaajaEdit"; // TODO
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
			return "pelaajaAdd";
		}

	}
}
