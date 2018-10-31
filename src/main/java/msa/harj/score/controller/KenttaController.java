package msa.harj.score.controller;

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
import msa.harj.score.dao.SeuraDAO;
import msa.harj.score.dao.TiiDAO;
import msa.harj.score.dao.VaylaDAO;
import msa.harj.score.model.Kentta;
import msa.harj.score.model.Seura;
import msa.harj.score.model.Tii;
import msa.harj.score.model.Vayla;

@Controller
public class KenttaController {
	private static final Log log = LogFactory.getLog(KenttaController.class);

	@Autowired
	private KenttaDAO kenttaDAO;

	@Autowired
	private SeuraDAO seuraDAO;

	@Autowired
	private TiiDAO tiiDAO;

	@Autowired
	private VaylaDAO vaylaDAO;

	@DeleteMapping("/kentta/del/{kenttaId}")
	public String naytaKentat(Model model, @PathVariable("kenttaId") Long kenttaId) {
		kenttaDAO.deleteKentta(kenttaId);
		List<Kentta> kentat = kenttaDAO.getKentat();
		model.addAttribute("kentat", kentat);

		return "kentta/kenttaLista";
	}

	@GetMapping("/kentta/edit/{kenttaId}")
	public String editKentta(Model model, @PathVariable("kenttaId") Long kenttaId) {
		log.info("MSA(get): /kentta/edit/" + kenttaId);
		Kentta k = kenttaDAO.getKentta(kenttaId);
		model.addAttribute("kentta", k);
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);
		List<Tii> tiit = tiiDAO.getKentanTiit(kenttaId);
		model.addAttribute("tiit", tiit);
		List<Vayla> vaylat = vaylaDAO.getKentanVaylat(kenttaId);
		model.addAttribute("vaylat", vaylat);
		return "kentta/kenttaEdit";
	}

	@PostMapping("/kentta/edit")
	public String updateKentta(Model model, Kentta k) {
		log.info("MSA(post): /kentta/edit/" + k.getId() + " " + k.getKentan_nimi());
		kenttaDAO.updateKentta(k);

		List<Kentta> kentat = kenttaDAO.getKentat();
		model.addAttribute("kentat", kentat);
		return "kentta/kenttaLista";
	}

	@GetMapping("/kentta/new")
	public String newKentta(Model model) {
		log.info("MSA(get): /kentta/add");
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);
		return "kentta/kenttaAdd";
	}

	@PostMapping("/kentta/add")
	public String addKentta(Model model, Kentta kentta) {
		log.info("MSA(post): /kentta/add " + kentta);

		kenttaDAO.addKentta(kentta);

		List<Kentta> kentat = kenttaDAO.getKentat();
		model.addAttribute("kentat", kentat);
		return "kentta/kenttaLista";
	}

}
