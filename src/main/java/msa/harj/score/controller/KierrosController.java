package msa.harj.score.controller;

import java.security.Principal;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import msa.harj.score.dao.KenttaDAO;
import msa.harj.score.dao.KierrosDAO;
import msa.harj.score.dao.PelaajaDAO;
import msa.harj.score.dao.TiiDAO;
import msa.harj.score.model.Kentta;
import msa.harj.score.model.Kierros;
import msa.harj.score.model.Pelaaja;
import msa.harj.score.model.Tii;

@Controller
public class KierrosController {
	private static final Log log = LogFactory.getLog(KierrosController.class);

	@Autowired
	private PelaajaDAO pelaajaDAO;

	@Autowired
	private KierrosDAO kierrosDAO;

	@Autowired
	private KenttaDAO kenttaDAO;

	@Autowired
	private TiiDAO tiiDAO;

	@GetMapping("/kierros/add")
	public String addKierros(Model model, Kierros kierros, Pelaaja pelaaja,  Principal principal) {
		log.info("MSA: /kierros/add");
		model.addAttribute("kierros", kierros);
		List<Kentta> kentat = kenttaDAO.getKentat();
		model.addAttribute("kentat", kentat);
		List<Tii> tiit = tiiDAO.getKaikkiTiit();
		model.addAttribute("tiit", tiit);
		
		// haetaan pelaaja, jos ei saada parametrina
		if (pelaaja == null) {
			pelaaja = pelaajaDAO.getPelaaja(principal.getName());
		}
		model.addAttribute("pelaaja", pelaaja);
		return "kierros/kierrosEdit"; // TODO
	}

	@PostMapping("/kierros/add")
	public String postKierros(Model model, Kierros kierros) {
		log.info("MSA(post) /kierros/add " + kierros.getJasennumero());
		model.addAttribute("kierros", kierros);
		List<Kentta> kentat = kenttaDAO.getKentat();
		model.addAttribute("kentat", kentat);
		List<Tii> tiit = tiiDAO.getKaikkiTiit();
		model.addAttribute("tiit", tiit);
		try {
			kierrosDAO.addKierros(kierros);
			return "redirect:/kierrokset";
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage()); // return "/error";
			return "kierros/kierrosAdd";
		}
	}

	@GetMapping("/kierros/get/{kierrosId}")
	public String getKierros(Model model, @PathVariable("kierrosId") Long kierrosId) {
		log.info("MSA: /kierros/get/" + kierrosId);
		Kierros k = kierrosDAO.getKierros(kierrosId);
		model.addAttribute("kierros", k);
		return "kierros/kierrosTiedot";
	}

	@GetMapping("/kierros/edit/{kierrosId}")
	public String editKierros(Model model, @PathVariable("kierrosId") Long kierrosId, Principal principal) {
		// TODO: yksittäinen oma kierros keneltä tahansa
		return "welcomePage";
	}

	@PostMapping("/kierros/edit")
	public String editKierros(Model model, Kierros kierros, Principal principal) {
		// TODO: yksittäinen oma kierros
		return "welcomePage";
	}

	@GetMapping("/kierros/omat")
	public String getOmatKierrokset(Model model, Principal principal) {
		// TODO: kaikki omat kierrokset (vuodelta/kentältä ??)
		return "welcomePage";
	}

	@GetMapping("/kierros/pelaaja/{pelaajaId}")
	public String getPelaajanKierrokset(Model model, @PathVariable("pelaajaId") Long pelaajaId) {
		// TODO: kaikki ko. pelaajan kierrokset (vuodelta/kentältä ??)
		return "welcomePage";
	}

	@DeleteMapping("/kierros")
	public String deleteKierros(Model model, Kierros kierros) {
		// TODO:
		return "welcomePage";
	}

}
