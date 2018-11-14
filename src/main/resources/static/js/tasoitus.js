
function laskeTasoitusMuutos(tasoitus, pisteet, kokokierros) { // todo: CBA tänne ??
	//console.log("laskeTasoitusMuutos", tasoitus, pisteet, kokokierros);
	var bufZone;
	var muutos = 0;
	if (kokokierros) {
		//console.log("koko kierros");
		if (pisteet >= 36) {
			muutos = 36 - pisteet; // laskee x 
			//console.log("muutos = 36 - pisteet", muutos);
		} else {
			if (tasoitus > 36) {
				bufZone = 0;
			} else if (tasoitus > 26.5) {
				bufZone = 31;
			} else if (tasoitus > 18.5) {
				bufZone = 32;
			} else if (tasoitus > 11.5) {
				bufZone = 33;
			} else if (tasoitus > 4.5) {
				bufZone = 34;
			} else  {
				bufZone = 35;
			}
			//console.log("pisteet vs bufZone", pisteet, bufZone);
			if (pisteet < bufZone) 
				muutos = 1; // nousee
			else
				muutos = 0;			
		}
	} else {
		//console.log("9 reikää");
		var pisteet18r = pisteet+18; // takaysi pelattu tasoitukseen
		if (tasoitus < 4.5) { // ykkösryhmässä ei voi muuttua 9 reiän perusteella
			muutos = 0;
			//console.log("tasoitus < 4.5", muutos);
		} else {
			if (pisteet18r >= 36) {
				muutos = 36 - pisteet18r; // laskee x
				//console.log("muutos = 36 - pisteet18r", muutos);
			} else {
				if (tasoitus > 36) {
					bufZone = 0;
				} else if (tasoitus > 26.5) {
					bufZone = 33;
				} else if (tasoitus > 18.5) {
					bufZone = 34;
				} else if (tasoitus > 11.5) {
					bufZone = 35;
				} else if (tasoitus > 4.5) {
					bufZone = 35;
				}
				//console.log("pisteet18r vs bufZone", pisteet18r, bufZone);
				if (pisteet18r < bufZone) 
					muutos = 1; // nousee
				else
					muutos = 0;			
			}
		}
	}
	//console.log("laskeTasoitusMuutos palauttaa:", muutos);
	return muutos;
}

function alustaVanhaTasoitus() {
    document.getElementById('vanha_tasoitus').innerHTML = document.getElementById('tasoitus').value;
}

function uusiTasoitus(vanha_tasoitus, muutos) {
/*
HCP-ryhmä 	HCP 		BZ 18r 	BZ 9r 	nousee 	alenee
	1	 	plus–4,4 	35–36 	– 		0,1 	0,1
	2	 	4,5–11,4 	34–36 	35–36 	0,1 	0,2
	3	 	11,5–18,4 	33–36 	35–36 	0,1 	0,3
	4	 	18,5–26,4 	32–36 	34–36 	0,1 	0,4
	5	 	26,5–36,0 	31–36 	33–36 	0,1 	0,5
	6	 	37–54 		–	 	–	 	– 		1,0
*/
	//console.log("uusiTasoitus", vanha_tasoitus, muutos);
	var tasoitus = vanha_tasoitus;
	if (muutos > 0) {
		if (tasoitus < 36) {
			tasoitus += 0.1;
		}
	} else if (muutos < 0) {
		while (muutos < 0) {
			if (tasoitus > 36) {
				tasoitus--;
			} else if (tasoitus > 26.5) {
				tasoitus -= 0.5;
			} else if (tasoitus > 18.5) {
				tasoitus -= 0.4;
			} else if (tasoitus > 11.5) {
				tasoitus -= 0.3;
			} else if (tasoitus > 4.5) {
				tasoitus -= 0.2;
			} else  {
				tasoitus -= 0.1;
			}
			muutos++;
		}
	}
	//console.log("palauttaa", tasoitus);
	return tasoitus;
}

function tasoitusMuutos() {
	// pelaajaEdit -näytöllä ei voi käyttää tasoitusChange.a
	var vanha_tasoitus = Math.round(Number.parseFloat(document.getElementById('vanha_tasoitus').innerHTML)*10)/10;
	var uusi_tasoitus = Math.round(Number.parseFloat(document.getElementById('tasoitus').value)*10)/10;
	//console.log("tasoitusMuutos", vanha_tasoitus, uusi_tasoitus);
	if (uusi_tasoitus > vanha_tasoitus ) {
		// uusi_tasoitus = uusiTasoitus(vanha_tasoitus, 1); // oletetaan, että käyttäjä tietää mitä tekee
		// console.log("tasoitusMuutos+1", vanha_tasoitus, uusi_tasoitus);
		// document.getElementById('tasoitus').value = uusi_tasoitus;
	} else if (uusi_tasoitus < vanha_tasoitus ) {
		if (uusi_tasoitus + 1 < vanha_tasoitus) {
			// muutettu käsin, OK
		} else {
			// "napsauteltu" -0.1 -> laske muutos
			uusi_tasoitus = uusiTasoitus(vanha_tasoitus, -1);
			//console.log("tasoitusMuutos-1", vanha_tasoitus, uusi_tasoitus);
			document.getElementById('tasoitus').value = uusi_tasoitus;
		}
	} else {
		// console.log("tasoitusMuutos+-0", vanha_tasoitus, uusi_tasoitus);
	}
	document.getElementById('vanha_tasoitus').innerHTML = uusi_tasoitus;
}
