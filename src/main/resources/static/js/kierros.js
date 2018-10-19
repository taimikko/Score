//<#assign security=JspTaglibs["http://www.springframework.org/security/tags"]/>
//<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

var kenttaId=0;
var tiiId = 0;
//var kentat;
var tiit;
var seurat;
var jasentyypit;
var vaylat;
var pelaajanSukup;


function kenttaValinta() {
    kenttaId = document.getElementById('kentta').value;
    if (kentat === undefined) {
        console.log("DEBUG: kenttaValinta() id=", kenttaId, "kentat===undefined");
    } else {
        console.log("DEBUG: kenttaValinta() id=", kenttaId, "kenttiä on ",kentat.length);
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

    var tii;
    var ok = false;
    var optiot = "";
    for (i = 0; i < tiit.length; i++) {
        tii = tiit[i];
        if ((tii.kentta_id == kenttaId) && (tii.sukup == pelaajanSukup)) {
            console.log("for[", i, "]:", tii.kentta_id, tii.nimi, tii.slope, tii.cr);
            optiot += '<option value="' + tii.id + '">' + tii.tii_id + ' ' + tii.nimi + '</option> '
            ok = true;
        }
    }
    if (ok == true) {
        document.getElementById('tiiluettelo').innerHTML = '`' + optiot + '`';
    } else {
        console.log("Alusta oletusarvoilla.");
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
    console.log("pvmUpdate", pvm);
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

window.onload = function (e) {
    console.log("kierros.js window.onload", e);
    setRandomPvm();
}