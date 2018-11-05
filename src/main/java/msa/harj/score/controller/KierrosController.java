package msa.harj.score.controller;

import java.security.Principal;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String addKierros(Model model, Kierros kierros, Principal principal, @RequestParam(value = "paluu", required = false) String paluu) {
		log.info("MSA: /kierros/add");
		model.addAttribute("kierros", kierros);
		List<Kentta> kentat = kenttaDAO.getKentat();
		model.addAttribute("kentat", kentat);
		List<Tii> tiit = tiiDAO.getKaikkiTiit();
		model.addAttribute("tiit", tiit);
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);
		model.addAttribute("seurat", seurat);
		if ((paluu == null) || ( paluu.isEmpty())) {
			model.addAttribute("paluu", "");
		} else {
			model.addAttribute("paluu", paluu);
		}
		Pelaaja pelaaja = pelaajaDAO.getPelaaja(principal.getName());
		log.info("MSA: Pelaaja:" + pelaaja+ " paluu="+paluu);
		model.addAttribute("pelaaja", pelaaja);
		return "kierros/kierrosAdd"; 
	}

	@PostMapping("/kierros/add")
	public String postKierros(Model model, Kierros kierros, Principal principal, @RequestParam(value = "paluu", required = false) String paluu) {
		log.info("MSA(post) /kierros/add " + kierros.getJasennumero()+"\t"+kierros);
		try {
			kierrosDAO.addKierros(kierros);
			if ((paluu == null) || ( paluu.isEmpty())) {
				log.info("MSA: paluu==null");
			} else {
				log.info("MSA: paluu="+paluu);
			}
			
			if ((paluu == null) || ( paluu.isEmpty())) {
				return "redirect:/kierros/pelaaja?seura="+Long.toString(kierros.getSeura_id())+"&jasennumero="+Long.toString(kierros.getJasennumero());
			} else {
				return "redirect:"+paluu;
			}
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
			model.addAttribute("kierros", kierros);
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
	public String editKierros(Model model, @PathVariable("kierrosId") Long kierrosId, Principal principal, @RequestParam(value = "paluu", required = false) String paluu) {
		log.info("MSA: /kierros/edit/" + kierrosId);
		Kierros kierros = kierrosDAO.getKierros(kierrosId);
		log.info("löytyi kierros "+kierros);
		log.info("model:"+model);
		model.addAttribute("kierros", kierros);
		List<Kentta> kentat = kenttaDAO.getKentat();
		model.addAttribute("kentat", kentat);
		List<Tii> tiit = tiiDAO.getKaikkiTiit();
		model.addAttribute("tiit", tiit);
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);
		if ((paluu == null) || ( paluu.isEmpty())) {
			model.addAttribute("paluu", "");
		} else {
			model.addAttribute("paluu", paluu);
		}
		Pelaaja pelaaja = pelaajaDAO.getPelaaja(kierros.getSeura_id(), kierros.getJasennumero());
		log.info("MSA: Pelaaja:" + pelaaja);
		model.addAttribute("pelaaja", pelaaja);
		return "kierros/kierrosEdit"; 
	}

	@PostMapping("/kierros/edit")
	public String editKierros(Model model, Kierros kierros, Principal principal, @RequestParam(value = "paluu", required = false) String paluu) {
		log.info("MSA(post) /kierros/edit " + kierros.getJasennumero());
		kierrosDAO.updateKierros(kierros);
		if ((paluu == null) || ( paluu.isEmpty())) {
			return "redirect:/kierros/omat";
		} else {
			return "redirect:"+paluu;
		}
	}

	@GetMapping("/kierros/omat")
	public String getOmatKierrokset(Model model, Principal principal) {
		log.info("MSA: GET /kierros/omat "+principal.getName());
		Pelaaja pelaaja = pelaajaDAO.getPelaaja(principal.getName());
		model.addAttribute("pelaaja", pelaaja);
		List<Kierros> kierrokset = kierrosDAO.getKierros(pelaaja.getSeuraId(), pelaaja.getJasennumero());
		model.addAttribute("kierrokset", kierrokset);
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);
		return "kierros/kierrosHistoria";
	}

	@GetMapping("/kierros/pelaaja")
	public String getPelaajanKierrokset(Model model, @RequestParam("seura") Long seuraId,
			@RequestParam("jasennumero") Long pelaajaId) {
		log.info("MSA: GET /kierros/pelaaja seuraId="+seuraId+" pelaajaId="+pelaajaId);

		Pelaaja pelaaja = pelaajaDAO.getPelaaja(seuraId, pelaajaId);
		model.addAttribute("pelaaja", pelaaja);
		List<Kierros> kierrokset = kierrosDAO.getKierros(pelaaja.getSeuraId(), pelaaja.getJasennumero());
		model.addAttribute("kierrokset", kierrokset);
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);
		return "kierros/kierrosHistoria";
	}

	@PostMapping("/kierros/del/{kierrosId}")
	public String deleteKierros(Model model, Principal principal, @PathVariable("kierrosId") Long kierrosId, 
			@RequestParam(value = "paluu", required = false) String paluu) {
		log.info("MSA: POST /kierros/del/"+kierrosId+" paluu:"+paluu);
		// tässä voisi tarkistaa että principal.user vastaa kierroksen pelaajaa tai principal on ADMIN
		kierrosDAO.deleteKierros(kierrosId);
		if ((paluu == null) || ( paluu.isEmpty())) {
			return "redirect:/kierros/omat";
		} else {
			return "redirect:"+paluu;
		}
		// joko redirect:"/admin/kierrokset" tai redirect:/kierros/omat tai redirect:"/kierros/pelaaja/{seuraId}+{pelaajaId}" 
	}

}
