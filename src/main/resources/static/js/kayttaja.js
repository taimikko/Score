
async function tarkistaKayttajatunnus(element, salliSamaNimi) {
    console.log("tarkistaKayttajatunnus(" + element+","+salliSamaNimi + ")");
    const kayttajatunnus = document.getElementById(element).value;
    try {
        const res = await fetch('/kayttaja/onkoVarattu/' + kayttajatunnus);

        if (res.status != 200) {
            return;
        }
        const data = await res.text();
        console.log(data);
        var varattu = JSON.parse(data);
        if (varattu) {
            if (salliSamaNimi) {
                document.getElementById('huom').innerHTML = "käyttäjätunnus on olemassa";
            } else {
                document.getElementById('huom').innerHTML = "käyttäjätunnus on jo varattu, valitse toinen";
                document.getElementById(element).focus();
                document.getElementById(element).select();
            }
        } else {
            document.getElementById('huom').innerHTML = "";
        }
    } finally {}
}

async function haeVapaaNumero() {
    console.log("function haeVapaaNumero()");
    const seura_id = document.getElementById('seuraId').value;
    try {
        const res = await fetch('/kayttaja/vapaaJasennumero/' + seura_id);

        if (res.status != 200) {
            return;
        }
        const data = await res.text();
        console.log(data);
        document.getElementById('jasennumero').value = JSON.parse(data);
    } finally {}
}
