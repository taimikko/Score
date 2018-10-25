// <#assign security=JspTaglibs["http://www.springframework.org/security/tags"]/>
// <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

var kenttaId = 0;
var tiiId = 0;
var kentat;
var tiit;
var seurat;
var jasentyypit;
var vaylat;
var pelaajanSukup;
var kierros=0;

function alustaTiitInput() { // input -tyyppisen kentän alustus ja valinta (valinta ei toimi)
    var tii;
    var ok = false;
    var optiot = "";

    if (tiit === undefined) {
        console.log("DEBUG: tiit===undefined");
    } else {
        console.log("DEBUG: tiit on ", tiit.length, tiit);
    }
    console.log("pelaajan sukupuoli=", pelaajanSukup);

    for (var i = 0; i < tiit.length; i++) {
        tii = tiit[i];
        if ((tii.kentta_id == kenttaId) && (tii.sukup == pelaajanSukup)) {
            console.log("for[", i, "]:", tii.kentta_id, tii.nimi, tii.slope, tii.cr);
            optiot += '<option value="' + tii.id + '" >' + tii.id + ' ' + tii.nimi + '</option> '
            ok = true;
        } 
    }
    if (ok == true) {
        document.getElementById('tiiluettelo').innerHTML = '`' + optiot + '`';
    } else {
        console.log("Alusta tiit oletusarvoilla.");
        document.getElementById('tiiluettelo').innerHTML = `
        <option value="2" selected>Keltainen</option>
        <option value="3">Sininen</option>
        <option value="4">Punainen</option>
        `;
    }
    document.getElementById('tii_nimi').innerHTML = '';

    var t = document.getElementById('tii'); 
    console.log("MSA:",t); 
//    t.value = t.options[0].value; // "";

    t.focus();
    //t.select();

    //tiiValinta();
}

function alustaTiitSelect() { // select -tyyppisen kentän alustus ja valinta
    var tii;
    var ok = false;
    var optiot = "";

    if (tiit === undefined) {
        console.log("DEBUG: tiit===undefined");
    } else {
        console.log("DEBUG: tiit on ", tiit.length, tiit);
    }
    console.log("pelaajan sukupuoli=", pelaajanSukup);

    for (var i = 0; i < tiit.length; i++) {
        tii = tiit[i];
        if ((tii.kentta_id == kenttaId) && (tii.sukup == pelaajanSukup)) {
            console.log("for[", i, "]:", tii.kentta_id, tii.nimi, tii.slope, tii.cr);
            optiot += '<option value="' + tii.id + '" >' + tii.nimi + '</option> '
            ok = true;
        } 
    }

    var t = document.getElementById('tii'); 

    if (ok == true) {
        t.innerHTML = '`' + optiot + '`';
    } else {
        console.log("Alusta tiit oletusarvoilla.");
        t.innerHTML = `
        <option value="2" selected >Keltainen</option>
        <option value="3">Sininen</option>
        <option value="4">Punainen</option>
        `;
    }
    document.getElementById('tii_nimi').innerHTML = '';

    console.log("MSA:",t); //.options[0].text);
    // t.value = t.options[0].value; // "";

    t.options[1].selected = true;
    t.focus();
}

function kenttaValinta() {
    // uutta kierrosta tehtäessä
    kenttaId = document.getElementById('kentta').value;
    if (kentat === undefined) {
        console.log("DEBUG: kenttaValinta() id=", kenttaId, "kentat===undefined");
    } else {
        console.log("DEBUG: kenttaValinta() id=", kenttaId, "kenttiä on ", kentat.length, kentat);
    }

    var kentan_nimi;
    var kentta;
    for (var i = 0; i < kentat.length; i++) {
        kentta = kentat[i];
        if (kentta.id == kenttaId) {
            kentan_nimi = kentta.nimi;
            break;
        }
    }
    console.log("DEBUG: id=", kenttaId, kentan_nimi);
    document.getElementById('kentta_nimi').innerHTML = kentan_nimi;

    alustaTiitSelect();
}

function kenttaValinta2() {
    // tulosta päivitettäessä
    kenttaId = document.getElementById('kentta').value;
    if (kentat === undefined) {
        console.log("DEBUG: kenttaValinta() id=", kenttaId, "kentat===undefined");
    } else {
        console.log("DEBUG: kenttaValinta() id=", kenttaId, "kenttiä on ", kentat.length, kentat);
    }

    var kentan_nimi;
    var kentta;
    for (var i = 0; i < kentat.length; i++) {
        kentta = kentat[i];
        if (kentta.id == kenttaId) {
            kentan_nimi = kentta.nimi;
            break;
        }
    }
    console.log("DEBUG: id=", kenttaId, kentan_nimi);
    document.getElementById('kentta_nimi').innerHTML = kentan_nimi;

    alustaTiitInput();
}


function tiiValinta() {
    tiiId = document.getElementById('tii').value;
    var tii_nimi;
    var tii;
    for (var i = 0; i < tiit.length; i++) {
        tii = tiit[i];
        if (tii.id == tiiId) {
            tii_nimi = tii.nimi;
            break;
        }
    }
    console.log("DEBUG: tii=", tiiId, tii_nimi);
    document.getElementById('tii_nimi').innerHTML = tii_nimi;
    //document.getElementById('h1').focus();
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

    document.getElementById('pvm1').innerHTML = pvm; // pvmUpdate haki ennen innerHTML:ää
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
    var p_kentta = 'p'+(document.activeElement.id).substr(1);
    var lyonnit = document.activeElement.value;

    if (Number.isInteger(Number.parseInt(lyonnit))) {
        var oma_par = 5;
        pisteet = (lyonnit<=0 || lyonnit>(oma_par+2)) ? 0 : (oma_par + 2) - lyonnit;
    } else {
        pisteet = 0;
    }
    console.log(document.activeElement.id,"lyönnit",lyonnit,"pisteet",pisteet);
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
    txt = "poistetaan kierros ("+id+")\n"+
          "pvm :"+pvm+"\n"+
          "pelaaja:"+etunimi+" "+sukunimi+"\n"+
          "huom:"+lisatieto+"\n"+
          "tulos:"+yhteensa;
    console.log("poista_kierros:",txt)
    if (confirm(txt)) {
        txt = "Valitsit OK, mutta poistoa ei ole toteutettu";
    } else {
        txt = "peruit koko homman";
    }
    document.getElementById("demo").innerHTML = txt;
}

window.onload = function (e) {
    console.log("kierros.js window.onload", e);
    //setRandomPvm();
    alustaPvm();
    var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth; 
    var height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

    console.log("näytön koko", width, height);
}