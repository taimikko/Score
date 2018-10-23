//<#assign security=JspTaglibs["http://www.springframework.org/security/tags"]/>
//<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

var kenttaId = 0;
var tiiId = 0;
var kentat;
var tiit;
var seurat;
var jasentyypit;
var vaylat;
var pelaajanSukup;
var kierros=0;

function kenttaValinta() {
    //var modelkentat = //'<%: Model.kentat %>' ; // '@Model.kentat';
    //console.log("ModelKentat",modelkentat);

    kenttaId = document.getElementById('kentta').value;
    if (kentat === undefined) {
        console.log("DEBUG: kenttaValinta() id=", kenttaId, "kentat===undefined");
    } else {
        console.log("DEBUG: kenttaValinta() id=", kenttaId, "kenttiä on ", kentat.length, kentat);
    }
    if (tiit === undefined) {
        console.log("DEBUG: kenttaValinta() tiit===undefined");
    } else {
        console.log("DEBUG: kenttaValinta() tiit on ", tiit.length, tiit);
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
    console.log("pelaajan sukup=", pelaajanSukup);

    var tii;
    var ok = false;
    var optiot = "";
    for (var i = 0; i < tiit.length; i++) {
        tii = tiit[i];
        if ((tii.kentta_id == kenttaId) && (tii.sukup == pelaajanSukup)) {
            console.log("for[", i, "]:", tii.kentta_id, tii.nimi, tii.slope, tii.cr);
            optiot += '<option value="' + tii.id + '">' + tii.tii_id + ' ' + tii.nimi + '</option> '
            ok = true;
        } else if (tii.kentta_id == kenttaId) {
            console.log("for[", i, "]:", tii.kentta_id, tii.nimi, "eri sukup:", tii.sukup, pelaajanSukup);
        }
    }
    if (ok == true) {
        document.getElementById('tiiluettelo').innerHTML = '`' + optiot + '`';
    } else {
        console.log("Alusta tiit oletusarvoilla.");
        document.getElementById('tiiluettelo').innerHTML = `
        <option value="2">Keltainen</option>
        <option value="3">Sininen</option>
        <option value="4">Punainen</option>
        `;
    }
    document.getElementById('tii').value = '';
    document.getElementById('tii_nimi').innerHTML = '';
    document.getElementById('kentta_nimi').innerHTML = kentan_nimi;
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

function seuraava(e, kentt1) {
    var key;
    if (window.event) { // IE                    
        key = e.keyCode;
    } else if (e.which) { // Netscape/Firefox/Opera                   
        key = e.which;
    }

    if (Number.isInteger(Number.parseInt(document.activeElement.value))) {
        document.activeElement.value = Number.parseInt(document.activeElement.value);
    } else {
        document.activeElement.value = "";
    }

    laske_yhteensa();

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
    
    console.log("kierros", kierros);
}