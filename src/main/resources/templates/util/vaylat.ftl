<#-- Freemarkerilla ladataan vaylat, ja jos ei löydy niin luodaan testikentän 999 väylät -->
<#if vaylat??>
    vaylat=[<#list vaylat as vayla>{id:"${vayla.id?c}",kentta_id:"${vayla.kentta_id?c}",numero:"${vayla.numero?c}",nimi:"${vayla.nimi}",par:"${vayla.par}",
            pit1:"${vayla.pit1?c}",pit2:"${vayla.pit2?c}",pit3:"${vayla.pit3?c}",pit4:"${vayla.pit4?c}",hcp:"${vayla.hcp}"},</#list>];
<#else>
    vaylat=[{id:"649",kentta_id:"999",numero:"1",nimi:"",par:"5", pit1:"435",pit2:"428",pit3:"420",pit4:"401",hcp:"5"},
            {id:"650",kentta_id:"999",numero:"2",nimi:"",par:"4", pit1:"338",pit2:"331",pit3:"315",pit4:"311",hcp:"9"},
            {id:"651",kentta_id:"999",numero:"3",nimi:"",par:"4", pit1:"344",pit2:"319",pit3:"300",pit4:"287",hcp:"3"},
            {id:"652",kentta_id:"999",numero:"4",nimi:"",par:"4", pit1:"357",pit2:"327",pit3:"300",pit4:"287",hcp:"13"},
            {id:"653",kentta_id:"999",numero:"5",nimi:"",par:"4", pit1:"404",pit2:"371",pit3:"350",pit4:"346",hcp:"1"},
            {id:"654",kentta_id:"999",numero:"6",nimi:"",par:"5", pit1:"457",pit2:"443",pit3:"416",pit4:"350",hcp:"7"},
            {id:"655",kentta_id:"999",numero:"7",nimi:"",par:"4", pit1:"318",pit2:"308",pit3:"261",pit4:"241",hcp:"17"},
            {id:"656",kentta_id:"999",numero:"8",nimi:"",par:"4", pit1:"358",pit2:"345",pit3:"301",pit4:"293",hcp:"11"},
            {id:"657",kentta_id:"999",numero:"9",nimi:"",par:"3", pit1:"137",pit2:"130",pit3:"110",pit4:"99",hcp:"15"},
            {id:"658",kentta_id:"999",numero:"10",nimi:"",par:"4", pit1:"340",pit2:"310",pit3:"280",pit4:"268",hcp:"10"},
            {id:"659",kentta_id:"999",numero:"11",nimi:"",par:"3", pit1:"198",pit2:"192",pit3:"174",pit4:"161",hcp:"8"},
            {id:"660",kentta_id:"999",numero:"12",nimi:"",par:"5", pit1:"514",pit2:"499",pit3:"475",pit4:"460",hcp:"6"},
            {id:"661",kentta_id:"999",numero:"13",nimi:"",par:"4", pit1:"321",pit2:"301",pit3:"290",pit4:"270",hcp:"14"},
            {id:"662",kentta_id:"999",numero:"14",nimi:"",par:"3", pit1:"149",pit2:"145",pit3:"135",pit4:"130",hcp:"18"},
            {id:"663",kentta_id:"999",numero:"15",nimi:"",par:"4", pit1:"345",pit2:"330",pit3:"317",pit4:"277",hcp:"4"},
            {id:"664",kentta_id:"999",numero:"16",nimi:"",par:"5", pit1:"464",pit2:"419",pit3:"400",pit4:"382",hcp:"12"},
            {id:"665",kentta_id:"999",numero:"17",nimi:"",par:"3", pit1:"179",pit2:"155",pit3:"151",pit4:"148",hcp:"16"},
            {id:"666",kentta_id:"999",numero:"18",nimi:"",par:"4", pit1:"400",pit2:"381",pit3:"359",pit4:"344",hcp:"2"}];
</#if>
