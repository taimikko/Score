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
import org.springframework.web.bind.annotation.ResponseBody;

import msa.harj.score.dao.JasenTyyppiDAO;
import msa.harj.score.dao.KayttajaDAO;
import msa.harj.score.dao.KayttajaRooliDAO;
import msa.harj.score.dao.PelaajaDAO;
import msa.harj.score.dao.RooliDAO;
import msa.harj.score.dao.SeuraDAO;
import msa.harj.score.model.JasenTyyppi;
import msa.harj.score.model.Kayttaja;
import msa.harj.score.model.Pelaaja;
import msa.harj.score.model.Rooli;
import msa.harj.score.model.Seura;
import msa.harj.score.model.UusiKayttaja;

@Controller
public class KayttajaController {
	private static final Log log = LogFactory.getLog(KayttajaController.class);

	@Autowired
	private KayttajaDAO kayttajaDAO;

	@Autowired
	private KayttajaRooliDAO kRooliDAO;

	@Autowired
	private RooliDAO rooliDAO;

	@Autowired
	private PelaajaDAO pelaajaDAO;

	@Autowired
	private JasenTyyppiDAO jasenTyyppiDAO;

	@Autowired
	private SeuraDAO seuraDAO;

	@GetMapping("/kayttaja/new")
	public String newKayttaja(Model model, Principal principal) {
		log.info("MSA: /kayttaja/new");
		UusiKayttaja k = new UusiKayttaja("", "");
		model.addAttribute("kayttaja", k);
		List<JasenTyyppi> jasenTyypit = jasenTyyppiDAO.getJasenTyypit();
		model.addAttribute("jasentyypit", jasenTyypit);
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);
		List<Rooli> roolit = rooliDAO.getRoolit();
		model.addAttribute("roolit", roolit);
		String username = principal.getName();
		Kayttaja admin = kayttajaDAO.getKayttaja(username);
		Long seura_id = admin.getSeuraId();
		Long vapaanumero = kayttajaDAO.haeVapaaJasennumero(seura_id);
		model.addAttribute("seura_id", seura_id);
		model.addAttribute("vapaanumero", vapaanumero);

		return "kayttaja/kayttajaNew";
	}

	@PostMapping("/kayttaja/del/{kayttajatunnus}")
	public String poistaKayttaja(@PathVariable("kayttajatunnus") String kayttajatunnus) {
		log.info("MSA: delete(" + kayttajatunnus + ")");
		Kayttaja k = kayttajaDAO.getKayttaja(kayttajatunnus);
		kayttajaDAO.deleteKayttaja(kayttajatunnus);
		pelaajaDAO.deletePelaajaHistoria(k.getSeuraId(), k.getJasennumero());
		return "redirect:/kayttajaluettelo";
	}

	/*
	 * @DeleteMapping("/kayttaja/del/{kayttajatunnus}") public void
	 * deleteKayttaja(@PathVariable("kayttajatunnus") String kayttajatunnus) {
	 * log.info("MSA: delete(" + kayttajatunnus + ")");
	 * kayttajaDAO.deleteKayttaja(kayttajatunnus); }
	 */

	@GetMapping("/kayttaja/edit/{kayttajatunnus}")
	public String editKayttaja(Model model, Principal principal,
			@PathVariable("kayttajatunnus") String kayttajatunnus) {
		log.info("MSA: /kayttaja/edit/" + kayttajatunnus);
		Kayttaja k = kayttajaDAO.getKayttaja(kayttajatunnus);
		model.addAttribute("kayttaja", k);
		log.info("MSA: editKayttaja()" + k);
		List<JasenTyyppi> jasenTyypit = jasenTyyppiDAO.getJasenTyypit();
		model.addAttribute("jasentyypit", jasenTyypit);
		List<Seura> seurat = seuraDAO.getSeurat();
		model.addAttribute("seurat", seurat);
		List<Rooli> roolit = rooliDAO.getRoolit();
		model.addAttribute("roolit", roolit);

		List<String> strRoolit = rooliDAO.getRoleNames(k.getKayttajaId());
		model.addAttribute("kayttajaroolit", strRoolit);

		return "kayttaja/kayttajaEdit";
	}

	@PostMapping("/kayttaja/edit")
	public String updateKayttaja(Model model, Kayttaja kayttaja, UusiKayttaja newUser, Principal principal,
			Long[] rooli) {
//		log.info("MSA: (post) /kayttaja/edit:" + kayttaja);

		kayttajaDAO.updateKayttaja(kayttaja);
		kRooliDAO.updateKayttajaRoolit(kayttaja.getKayttajaId(), rooli);

		List<String> rooliLista = rooliDAO.getRoleNames(kayttaja.getKayttajaId());
		model.addAttribute("roolit", rooliLista);

		return "redirect:/kayttajaluettelo";
	}

	@PostMapping("/kayttaja/add")
	public String addKayttaja(Model model, UusiKayttaja newUser, Principal principal, Long[] rooli) {
		log.info("MSA: /kayttaja/add");
		if (model.containsAttribute("newUser")) {
			log.info("Modelissa on newUser");
			log.info(model.toString());
			log.info("Model.newUser:" + newUser);
		} else {
			log.info("Modelissa ei ole \"newUser\":ia!");
		}

		if (!newUser.isPasswordOk()) {
			String message = "<br> Salasanat eivät ole samoja <br> give password again";
			model.addAttribute("message", message);
			model.addAttribute("user", newUser);
			return "kayttaja/kayttajaNew";
		}
		newUser.encrytePassword(); // poistaa samalla näkyvät salasanat

		log.info("MSA: newUser: " + newUser);
		kayttajaDAO.addNewUserAccount(newUser);
		Kayttaja appUser = kayttajaDAO.getKayttaja(newUser.getUsername()); // kantaan talletettu id
		kRooliDAO.updateKayttajaRoolit(appUser.getKayttajaId(), rooli);

		Pelaaja p = new Pelaaja();
		p.setEtunimi((String) newUser.getEtunimi());
		p.setSukunimi((String) newUser.getSukunimi());
		p.setUsername(newUser.getUsername());
		p.setSukup(newUser.getSukup());
		p.setJasentyyppi(newUser.getJasen_tyyppi());
		p.setTasoitus(newUser.getTasoitus());
		p.setTasoitus_voimassa(newUser.isTasoitus_voimassa());
		p.setSeuraId(newUser.getSeuraIdL());
		p.setJasennumero(newUser.getJasennumero());
//		protected Long kayttajaId;
//		protected String encrytedPassword;
//		p.setEnabled(newUser.getEnabled());
//		private Long id;
//		private Timestamp pvm;

		log.info("MSA: lisätään myös pelaaja-tauluun:" + p);
		pelaajaDAO.addPelaaja(p);

		Kayttaja k = kayttajaDAO.getKayttaja(p.getUsername());
		model.addAttribute("kayttaja", k);
		log.info("MSA: uusi käyttäjä:" + k);

		List<String> rooliLista = rooliDAO.getRoleNames(k.getKayttajaId());
		model.addAttribute("roolit", rooliLista);

		List<JasenTyyppi> jasentyypit = jasenTyyppiDAO.getJasenTyypit();
		model.addAttribute("jasentyypit", jasentyypit);

		return "kayttaja/kayttajaTiedot";
	}

	@GetMapping("/kayttajaluettelo")
	public String kayttajaLista(Model model) {
		log.info("MSA: /kayttajaluettelo");
		Long seura = 78L;
		List<Kayttaja> k = kayttajaDAO.getKayttajat(seura);
		model.addAttribute("kayttajat", k);
		String str = "";
		for (Kayttaja kayttaja : k) {
			str += kayttaja.toString() + "\t";
		}
		log.info("userList palauttaa(" + Integer.toString(k.size()) + "):" + str);
		return "kayttaja/kayttajaLista";
	}

	@GetMapping("/kayttaja/seura/{seura_id}")
	public String kayttajaLista(Model model, @PathVariable("seura_id") Long seura_id) {
		log.info("MSA: /kayttaja/seura/" + Long.toString(seura_id));
		List<Kayttaja> k = kayttajaDAO.getKayttajat(seura_id);
		model.addAttribute("kayttajat", k);
		String str = "";
		for (Kayttaja kayttaja : k) {
			str += kayttaja.toString() + "\t";
		}
		log.info("userList palauttaa(" + Integer.toString(k.size()) + "):" + str);
		List<JasenTyyppi> jasentyypit = jasenTyyppiDAO.getJasenTyypit();
		model.addAttribute("jasentyypit", jasentyypit);
		return "kayttaja/kayttajaLista";
	}

	@GetMapping("/kayttajaInfo")
	public String kayttajaTiedot(Model model, Principal principal,
			@RequestParam(value = "kayttajatunnus", required = false) String kayttajatunnus) {
		String username = principal.getName();
		log.info("MSA: /kayttajaInfo?kayttajatunnus=" + kayttajatunnus + " " + username);
		List<JasenTyyppi> jasentyypit = jasenTyyppiDAO.getJasenTyypit();
		model.addAttribute("jasentyypit", jasentyypit);
		if ((kayttajatunnus == null) || (!username.equals(kayttajatunnus))) {
			return "kayttaja/kayttajaInfo";
		} else {
			log.info("MSA: kayttajatunnus = username " + kayttajatunnus + " = " + username);
			Kayttaja k = kayttajaDAO.getKayttaja(kayttajatunnus);
			model.addAttribute("kayttaja", k);
			List<String> roolit = rooliDAO.getRoleNames(k.getKayttajaId());
			model.addAttribute("roolit", roolit);

			return "kayttaja/kayttajaTiedot";
		}
	}

	@GetMapping("/kayttaja/info")
	public String kayttajaInfo(Model model, Principal principal,
			@RequestParam(value = "kayttajatunnus", required = false) String kayttajatunnus) {
		String username = principal.getName();
		log.info("MSA: ADMIN only: kayttajatunnus username " + kayttajatunnus + " " + username);
		List<JasenTyyppi> jasentyypit = jasenTyyppiDAO.getJasenTyypit();
		model.addAttribute("jasentyypit", jasentyypit);
		Kayttaja k = kayttajaDAO.getKayttaja(kayttajatunnus);
		model.addAttribute("kayttaja", k);
		List<String> roolit = rooliDAO.getRoleNames(k.getKayttajaId());
		model.addAttribute("roolit", roolit);

		return "kayttaja/kayttajaTiedot";
	}

	@GetMapping("/kayttaja/vapaaJasennumero/{seura_id}")
	public @ResponseBody Long vapaaJasennumero(Model model, Principal principal,
			@PathVariable("seura_id") Long seura_id) {
		return (kayttajaDAO.haeVapaaJasennumero(seura_id));
	}

}
