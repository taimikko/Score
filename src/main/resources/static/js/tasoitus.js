
function laskeTasoitusMuutos(tasoitus, pisteet, kokokierros) { // todo: CBA tänne ??
	var bufZone;
	if (kokokierros) {
		if (pisteet >= 36) {
			muutos = 36 - pisteet; // laskee x 
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
			if (pisteet < bufZone) 
				muutos = 1; // nousee
			else
				muutos = 0;			
		}
	} else {
		// 9 reikää
		if (tasoitus < 4.5) { // ykkösryhmässä ei voi muuttua 9 reiän perusteella
			muutos = 0;
		} else {
			pisteet += 18; // takaysi pelattu tasoitukseen
			if (pisteet >= 36) {
				muutos = 36 - pisteet; // laskee x 
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
				if (pisteet < bufZone) 
					muutos = 1; // nousee
				else
					muutos = 0;			
			}
		}
	}
}

function alustaVanhaTasoitus() {
    document.getElementById('vanha_tasoitus').value = document.getElementById('tasoitus').value;
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
	console.log("uusiTasoitus", vanha_tasoitus, muutos);
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
	console.log("palauttaa", tasoitus);
	return tasoitus;
}

function tasoitusMuutos() {
	// pelaajaEdit -näytöllä ei voi käyttää tasoitusChange.a
	var vanha_tasoitus = Math.round(Number.parseFloat(document.getElementById('vanha_tasoitus').value)*10)/10;
	var uusi_tasoitus = Math.round(Number.parseFloat(document.getElementById('tasoitus').value)*10)/10;
	console.log(vanha_tasoitus, uusi_tasoitus);
	if (uusi_tasoitus > vanha_tasoitus ) {
		uusi_tasoitus = uusiTasoitus(vanha_tasoitus, 1);
		console.log("tasoitusMuutos+1", vanha_tasoitus, uusi_tasoitus);
		document.getElementById('vanha_tasoitus').value = uusi_tasoitus;
		document.getElementById('tasoitus').value = uusi_tasoitus;
	} else if (uusi_tasoitus < vanha_tasoitus ) {
		uusi_tasoitus = uusiTasoitus(vanha_tasoitus, -1);
		console.log("tasoitusMuutos-1", vanha_tasoitus, uusi_tasoitus);
		document.getElementById('vanha_tasoitus').value = uusi_tasoitus;
		document.getElementById('tasoitus').value = uusi_tasoitus;
	} else {
		console.log("tasoitusMuutos+-0", vanha_tasoitus, uusi_tasoitus);
		document.getElementById('vanha_tasoitus').value = uusi_tasoitus;
	}
}
