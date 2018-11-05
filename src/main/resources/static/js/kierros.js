// <#assign security=JspTaglibs["http://www.springframework.org/security/tags"]/>
// <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

var seurat;
var kentat;
var vaylat;
var tiit;
//var jasentyypit;

var pelaajanSukup;
var pelaajat; // seuran pelaajat 

function alustaTiit(kentta_selected, tii_selected) { // select -tyyppisen kentän alustus ja valinta
    var tii;
    var ensimmainen = true;
    var optiot = "";
    var slope;
    var cr;

    if (tiit === undefined) {
        console.log("alustaTiit: tiit===undefined");
    } else {
        console.log("alustaTiit: tiit on ", tiit.length, tiit);
    }

    if (kentta_selected === undefined) {
        console.log("alustaTiit: kentta_selected === undefined");
        kentta_selected = kenttaId;
    } else {
        console.log("alustaTiit: kentta_selected ===  ", kentta_selected);
    }

    console.log("pelaajan sukupuoli=", pelaajanSukup, "tii_selected", tii_selected, kentta_selected);

    for (const tii of tiit) {
        if (tii.kentta_id == kentta_selected) {
            if ((tii_selected == undefined) || (tii_selected == 0)) { // asetaan ensimmäinen tii valituksi
                if (ensimmainen) {
                    optiot += '<option value="' + tii.id + '" selected="selected" >' + tii.nimi + '</option> '
                    if (pelaajanSukup == 2) {
                        slope = tii.slope_n;
                        cr = tii.cr_n;
                    } else {
                        slope = tii.slope;
                        cr = tii.cr;
                    }
                    ensimmainen = false;
                } else {
                    optiot += '<option value="' + tii.id + '" >' + tii.nimi + '</option> '
                }
            } else { // asetetaan parametrina saatu tii valituksi
                if (tii_selected == tii.id) {
                    optiot += '<option value="' + tii.id + '" selected="selected" >' + tii.nimi + '</option> '
                    if (pelaajanSukup == 2) {
                        slope = tii.slope_n;
                        cr = tii.cr_n;
                    } else {
                        slope = tii.slope;
                        cr = tii.cr;
                    }
                } else {
                    optiot += '<option value="' + tii.id + '" >' + tii.nimi + '</option> '
                }
            }
        }
    }

    var t = document.getElementById('tii_id');

    if (optiot.length > 0) {
        t.innerHTML = '`' + optiot + '`';
    } else {
        console.log("Alusta tiit oletusarvoilla.");
        t.innerHTML = `
        <option value="2" selected="selected" >Keltainen</option>
        <option value="3">Sininen</option>
        <option value="4">Punainen</option>
        `;
        cr = 72;
        slope = 126;
    }
    laskePelitasoitus(slope, cr, 72); //haeKentanPar(kentta_selected));
    document.getElementById('tii_nimi').innerHTML = '';
    console.log("MSA: focus tii");
    t.focus();
}


function haeKentanPar(kentta_id) {
    for (const kentta of kentat) {
        if (kentta.id == kentta_id) {
            return 72; // kenttätiedoissa ei olekaan par:ia
        }
    }
    return 72;
}


function laskePelitasoitus(slope, cr, par) {
    const tarkka = document.getElementById('tasoitus').value;
    document.getElementById('pelitasoitus').value = Math.trunc((slope * tarkka) / 113 + (cr - par)); // alaspäin pyöritettynä
    enableSubmit();
}

function alustaKentta(kentta_selected, tii_selected, element) {
    //element = 'kentta_id' (editissä) ja 'kenttaluettelo' (insertissä)
    var optiot = "";
    console.log("AlustaKentta");

    if (kentta_selected == undefined) {
        kentta_selected = 0;
    }

    var valinta = "";
    for (const kentta of kentat) {
        valinta = kentta.id + ". " + kentta.nimi; //kentta.nimi + " (" + kentta.id + ")" ; //kentta.id + ". " + kentta.nimi; 
        if (kentta.id == kentta_selected) {
            optiot += '<option value="' + kentta.id + '" selected="selected" >' + valinta + '</option> '
        } else {
            optiot += '<option value="' + kentta.id + '" >' + valinta + '</option> '
        }
    }

    document.getElementById(element).innerHTML = '`' + optiot + '`';

    if (kentta_selected === 0) { // asetaan ensimmäinen valituksi
        document.getElementById(element).options[0].selected = true;
    }

    alustaTiit(kentta_selected, tii_selected);
}

function kenttaValintaInput() {
    // uutta kierrosta tehtäessä
    var kentta_selected = document.getElementById('kentta_id').value;
    var kentan_nimi;
    for (const kentta of kentat) {
        if (kentta.id == kentta_selected) {
            kentan_nimi = kentta.nimi;
            break;
        }
    }
    document.getElementById('kentta_nimi').innerHTML = kentan_nimi;

    alustaTiit(kentta_selected, 0); // valittu tii puuttuuu
}

function kenttaChange() {
    console.log("kenttaChange", document.getElementById('kentta_id').value);
    alustaTiit(document.getElementById('kentta_id').value, 0);
}

function pelaajaValinta() {
    console.log("pelaajaValinta");
    const pelaaja_id = document.getElementById('jasennumero').value;
    for (pelaaja of pelaajat) {
        if (pelaaja.jasennumero == pelaaja_id) {
            document.getElementById('etunimi').value = pelaaja.etunimi;
            document.getElementById('sukunimi').value = pelaaja.sukunimi;
            document.getElementById('tasoitus').value = pelaaja.tasoitus;
            pelaajanSukup = pelaaja.sukup;
            console.log("pelaajaValinta löysi ", pelaaja, pelaajanSukup);
            tasoitusChange();
            break;
        }
    }
}

async function alustaPelaajat(seura_id) {
    try {
        const res = await fetch('/pelaaja/seuranjasenet?seura_id=' + seura_id);
        var parent = document.getElementById('jasennumero');
        var pelaaja_id = parent.value; // vanha valinta jonnekin jemmaan (näytetäänkö käyttäjälle?)
        document.getElementById('vanha_jasennumero').innerHTML = "(" + pelaaja_id + ")";
        if (res.status != 200) {
            return;
        }
        const data = await res.text();
        console.log(data);
        pelaajat = JSON.parse(data); // globaali
        var txt = "";
        for (pelaaja of pelaajat) {
            if (pelaaja.jasennumero == parent.value) {
                txt += '<option value="' + pelaaja.jasennumero + '" selected="selected" >' + pelaaja.jasennumero + ' ' + pelaaja.etunimi + ' ' + pelaaja.sukunimi + '</option>';
            } else {
                txt += '<option value="' + pelaaja.jasennumero + '">' + pelaaja.jasennumero + ' ' + pelaaja.etunimi + ' ' + pelaaja.sukunimi + '</option>';
            }
        }
        if (txt.length == 0)
            txt = pelaaja_id; // seurassa ei pelaajia  
        parent.innerHTML = '`' + txt + '`';
        console.log("seuraChange txt", txt);
    } finally {
        console.log("seuraChange finally", pelaajat);
    }
}

async function seuraChange() {
    var seura_id = document.getElementById('seura_id').value;
    console.log("seuraChange", seura_id);
    alustaPelaajat(seura_id);
}

function tiiChange() {
    console.log("tiiChange()", document.getElementById('tii_id').value);
    tasoitusChange();
    document.getElementById('h1').focus();
    document.getElementById('h1').select();
}

function tasoitusChange() {
    console.log("tasoitusChange()");

    const kentta_id = document.getElementById('kentta_id').value;
    const tii_id = document.getElementById('tii_id').value;
    var cr = 72; // jos kentälle ei ole määritelty tiitä, käytetään näitä oletusarvoja
    var slope = 126;
    for (const tii of tiit) {
        if (tii.kentta_id == kentta_id) {
            if (tii_id == tii.id) {
                if (pelaajanSukup == 2) { // pelaajavalinta päivittää
                    slope = tii.slope_n;
                    cr = tii.cr_n;
                } else {
                    slope = tii.slope;
                    cr = tii.cr;
                }
                break;
            }
        }
    }

    laskePelitasoitus(slope, cr, 72); //haeKentanPar(kentta_selected));
}


function getRandomPvm() {
    var end = new Date();
    var start = new Date(2000, 1, 1);
    var date = new Date(+start + Math.random() * (end - start));
    console.log("Date", date, date.toString(), date.getDate());
    return date;
}

function pvmUpdate() {
    var pvm = document.getElementById('pvm1').value; //.innerHTML; 
    document.getElementById('pvm_str').innerHTML = pvm;
}

function setRandomPvm() {
    var date = getRandomPvm();
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    var pvm = [y, (m > 9 ? '' : '0') + m, (d > 9 ? '' : '0') + d].join('-');

    console.log("RandomPvm", date, pvm);

    document.getElementById('pvm1').innerHTML = pvm; // pvmUpdate haki ennen innerHTML:ää
    document.getElementById('pvm1').value = pvm; // value asettaa arvon näkyviin
    pvmUpdate();
}

function alustaPvm() {
    var date = new Date();
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    var pvm = [y, (m > 9 ? '' : '0') + m, (d > 9 ? '' : '0') + d].join('-');

    //document.getElementById('pvm1').innerHTML = pvm; // pvmUpdate haki ennen innerHTML:ää
    document.getElementById('pvm1').value = pvm; // value asettaa arvon näkyviin
    pvmUpdate();
}

function lisaa(element) {
    if (Number.isInteger(Number.parseInt(element.value))) {
        return Number.parseInt(element.value);
    }
    return 0;
}

function laske_yhteensa() {
    var summa = 0;
    summa += lisaa(document.getElementById('h1'));
    summa += lisaa(document.getElementById('h2'));
    summa += lisaa(document.getElementById('h3'));
    summa += lisaa(document.getElementById('h4'));
    summa += lisaa(document.getElementById('h5'));
    summa += lisaa(document.getElementById('h6'));
    summa += lisaa(document.getElementById('h7'));
    summa += lisaa(document.getElementById('h8'));
    summa += lisaa(document.getElementById('h9'));
    document.getElementById('hout').value = summa;
    summa = 0;
    summa += lisaa(document.getElementById('h10'));
    summa += lisaa(document.getElementById('h11'));
    summa += lisaa(document.getElementById('h12'));
    summa += lisaa(document.getElementById('h13'));
    summa += lisaa(document.getElementById('h14'));
    summa += lisaa(document.getElementById('h15'));
    summa += lisaa(document.getElementById('h16'));
    summa += lisaa(document.getElementById('h17'));
    summa += lisaa(document.getElementById('h18'));
    document.getElementById('hin').value = summa;

    summa += Number.parseInt(document.getElementById('hout').value);
    document.getElementById('yhteensa').value = summa;

    summa = 0;
    summa += lisaa(document.getElementById('p1'));
    summa += lisaa(document.getElementById('p2'));
    summa += lisaa(document.getElementById('p3'));
    summa += lisaa(document.getElementById('p4'));
    summa += lisaa(document.getElementById('p5'));
    summa += lisaa(document.getElementById('p6'));
    summa += lisaa(document.getElementById('p7'));
    summa += lisaa(document.getElementById('p8'));
    summa += lisaa(document.getElementById('p9'));
    document.getElementById('p_out').value = summa;
    summa = 0;
    summa += lisaa(document.getElementById('p10'));
    summa += lisaa(document.getElementById('p11'));
    summa += lisaa(document.getElementById('p12'));
    summa += lisaa(document.getElementById('p13'));
    summa += lisaa(document.getElementById('p14'));
    summa += lisaa(document.getElementById('p15'));
    summa += lisaa(document.getElementById('p16'));
    summa += lisaa(document.getElementById('p17'));
    summa += lisaa(document.getElementById('p18'));
    document.getElementById('p_in').value = summa;

    summa += Number.parseInt(document.getElementById('p_out').value);
    document.getElementById('p_yht').value = summa;
}


function validate_int(e) {
    console.log("validate_int", e);
    if (e >= 48 && e <= 57) // 0 - 9 
    {
        return true;
    }
    return false;
}


function validate_key(e) {
    console.log("validate_key", e);
    if (e == 16 //  shift
        ||
        e == 8 // backspace
        ||
        e == 9 // tab
        ||
        e == 10 // LF
        ||
        e == 13 // enter
        ||
        e == 116 // F5 
        ||
        e == 46 // delete
        ||
        (e >= 37 && e <= 40) // nuolet: vasen, ylös, oikea, alas
    ) {
        return true;
    }
    return false;
}

function laske_pisteet(reika) {
    var pisteet;
    var p_kentta = 'p' + (document.activeElement.id).substr(1);
    var lyonnit = document.activeElement.value;

    if (Number.isInteger(Number.parseInt(lyonnit))) {
        var oma_par = 5;
        pisteet = (lyonnit <= 0 || lyonnit > (oma_par + 2)) ? 0 : (oma_par + 2) - lyonnit;
    } else {
        pisteet = 0;
    }
    console.log(document.activeElement.id, "lyönnit", lyonnit, "pisteet", pisteet);
    document.getElementById(p_kentta).value = pisteet;
}

function seuraava(e, kentt1) {
    var key;

    if (Number.isInteger(Number.parseInt(document.activeElement.value))) {
        document.activeElement.value = Number.parseInt(document.activeElement.value);
    } else {
        document.activeElement.value = "";
    }

    laske_pisteet(kentt1);
    laske_yhteensa();

    if (window.event) { // IE                    
        key = e.keyCode;
    } else if (e.which) { // Netscape/Firefox/Opera                   
        key = e.which;
    }

    if (document.activeElement.value > 1 && !validate_key(key)) {
        document.getElementById(kentt1).focus();
        document.getElementById(kentt1).select();
    }
}

function poista_kierros(id, pvm, etunimi, sukunimi, lisatieto, yhteensa) {
    var txt;
    txt = "poistetaan kierros (" + id + ")\n" +
        "pvm :" + pvm + "\n" +
        "pelaaja:" + etunimi + " " + sukunimi + "\n" +
        "huom:" + lisatieto + "\n" +
        "tulos:" + yhteensa;
    console.log("poista_kierros:", txt)
    if (confirm(txt)) {
        txt = "Valitsit OK, mutta poistoa ei ole toteutettu";
    } else {
        txt = "peruit koko homman";
    }
    document.getElementById("demo").innerHTML = txt;
}

function okvalue(elementId) {
    console.log("okvalue(", elementId, ")")
    return (document.getElementById(elementId).value != "");
}

function enableSubmit() {
    if (okvalue('kentta_id') && okvalue('tii_id') && okvalue('seura_id') && okvalue('jasennumero') && okvalue('pvm1') && okvalue('tasoitus')) {
        console.log("DEBUG: enableSubmit() true");
        document.getElementById('submit').disabled = false;
    } else {
        console.log("DEBUG: enableSubmit() false");
        document.getElementById('submit').disabled = true;
    }
}

window.onload = function (e) {
    console.log("kierros.js window.onload", e);
    //setRandomPvm();

    var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
    var height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

    console.log("näytön koko", width, height);
}