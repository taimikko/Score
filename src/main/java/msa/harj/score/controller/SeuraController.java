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
import msa.harj.score.model.Kentta;
import msa.harj.score.model.Seura;

@Controller
public class SeuraController {
	private static final Log log = LogFactory.getLog(SeuraController.class);

	@Autowired
	private SeuraDAO seuraDAO;

	@Autowired
	private KenttaDAO kenttaDAO;

	@GetMapping("/seura/seuraluettelo")
		public String listaaSeurat(Model model) {
		log.info("/seura/seuraluettelo");
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);
		return "seura/seuraLista";
	}
	
	@DeleteMapping("/seura/del/{seuraId}")
	public String delSeura(Model model, @PathVariable("seuraId") Long seuraId) {
		seuraDAO.deleteSeura(seuraId);
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);

		return "seura/seuraLista";
	}

	@GetMapping("/seura/edit/{seuraId}")
	public String editSeura(Model model, @PathVariable("seuraId") Long seuraId) {
		log.info("MSA(get): /seura/edit/" + seuraId);
		Seura s = seuraDAO.getSeura(seuraId);
		model.addAttribute("seura", s);
		List<Kentta> kentat = kenttaDAO.getKentat();
		model.addAttribute("kentat", kentat);
		return "seura/seuraEdit";
	}

	@PostMapping("/seura/edit")
	public String updateSeura(Model model, Seura s) {
		log.info("MSA(post): /seura/edit/" + s.getId() + " " + s.getNimi());
		seuraDAO.updateSeura(s);

		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);
		return "seura/seuraLista";
	}

	@GetMapping("/seura/new")
	public String newSeura(Model model) {
		log.info("MSA(get): /seura/add");
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);
		return "seura/seuraAdd";
	}

	@PostMapping("/seura/add")
	public String addSeura(Model model, Seura seura) {
		log.info("MSA(post): /seura/add " + seura);

		seuraDAO.addSeura(seura);

		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);
		return "seura/seuraLista";
	}

}
