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
import msa.harj.score.dao.SeuraDAO;
import msa.harj.score.dao.TiiDAO;
import msa.harj.score.model.Kentta;
import msa.harj.score.model.Kierros;
import msa.harj.score.model.Pelaaja;
import msa.harj.score.model.Seura;
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

	@Autowired
	private SeuraDAO seuraDAO;

	@GetMapping("/kierros/add")
	public String addKierros(Model model, Kierros kierros, Principal principal) {
		log.info("MSA: /kierros/add");
		model.addAttribute("kierros", kierros);
		List<Kentta> kentat = kenttaDAO.getKentat();
		model.addAttribute("kentat", kentat);
		List<Tii> tiit = tiiDAO.getKaikkiTiit();
		model.addAttribute("tiit", tiit);
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);

		Pelaaja pelaaja = pelaajaDAO.getPelaaja(principal.getName());
		log.info("MSA: Pelaaja:" + pelaaja);
		model.addAttribute("pelaaja", pelaaja);
		return "kierros/kierrosAdd"; // TODO
	}

	@PostMapping("/kierros/add")
	public String postKierros(Model model, Kierros kierros, Principal principal) {
		log.info("MSA(post) /kierros/add " + kierros.getJasennumero());
		model.addAttribute("kierros", kierros);

		try {
			kierrosDAO.addKierros(kierros);
			Pelaaja pelaaja = pelaajaDAO.getPelaaja(principal.getName());
			model.addAttribute("pelaaja", pelaaja);
			List<Kierros> kierrokset = kierrosDAO.getKierros(pelaaja.getSeuraId(), pelaaja.getJasennumero());
			model.addAttribute("kierrokset", kierrokset);
			return "kierros/kierrosHistoria";
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage()); // return "/error";
			List<Seura> seurat = seuraDAO.getSeurat();
			List<Kentta> kentat = kenttaDAO.getKentat();
			List<Tii> tiit = tiiDAO.getKaikkiTiit();
			Pelaaja pelaaja = pelaajaDAO.getPelaaja(principal.getName());
			model.addAttribute("seurat", seurat);
			model.addAttribute("kentat", kentat);
			model.addAttribute("tiit", tiit);
			model.addAttribute("pelaaja", pelaaja);
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
		log.info("MSA: /kierros/edit/" + kierrosId);
		Kierros kierros = kierrosDAO.getKierros(kierrosId);
		model.addAttribute("kierros", kierros);
		List<Kentta> kentat = kenttaDAO.getKentat();
		model.addAttribute("kentat", kentat);
		List<Tii> tiit = tiiDAO.getKaikkiTiit();
		model.addAttribute("tiit", tiit);
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);

		Pelaaja pelaaja = pelaajaDAO.getPelaaja(kierros.getSeura_id(), kierros.getJasennumero());
		log.info("MSA: Pelaaja:" + pelaaja);
		model.addAttribute("pelaaja", pelaaja);
		return "kierros/kierrosEdit"; // TODO
	}

	@PostMapping("/kierros/edit")
	public String editKierros(Model model, Kierros kierros, Principal principal) {
		log.info("MSA(post) /kierros/edit " + kierros.getJasennumero());

		kierrosDAO.updateKierros(kierros);
		Pelaaja pelaaja = pelaajaDAO.getPelaaja(principal.getName());
		model.addAttribute("pelaaja", pelaaja);
		List<Kierros> kierrokset = kierrosDAO.getKierros(pelaaja.getSeuraId(), pelaaja.getJasennumero());
		model.addAttribute("kierrokset", kierrokset);
		return "kierros/kierrosHistoria";
	}

	@GetMapping("/kierros/omat")
	public String getOmatKierrokset(Model model, Principal principal) {
		Pelaaja pelaaja = pelaajaDAO.getPelaaja(principal.getName());
		model.addAttribute("pelaaja", pelaaja);
		List<Kierros> kierrokset = kierrosDAO.getKierros(pelaaja.getSeuraId(), pelaaja.getJasennumero());
		model.addAttribute("kierrokset", kierrokset);
		return "kierros/kierrosHistoria";
	}

	@GetMapping("/kierros/pelaaja/{seuraId}+{pelaajaId}")
	public String getPelaajanKierrokset(Model model, @PathVariable("seuraId") Long seuraId,
			@PathVariable("pelaajaId") Long pelaajaId) {
		Pelaaja pelaaja = pelaajaDAO.getPelaaja(seuraId, pelaajaId);
		model.addAttribute("pelaaja", pelaaja);
		List<Kierros> kierrokset = kierrosDAO.getKierros(pelaaja.getSeuraId(), pelaaja.getJasennumero());
		model.addAttribute("kierrokset", kierrokset);
		return "kierros/kierrosHistoria";
	}

	@DeleteMapping("/kierros")
	public String deleteKierros(Model model, Kierros kierros) {
		// TODO:
		return "welcomePage";
	}

}
