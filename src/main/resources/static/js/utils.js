// const getCellValue = (tr, idx) => tr.children[idx].innerText || tr.children[idx].textContent.trim();

// const comparer = (idx, asc) =>
//     (a, b) => (
//         (v1, v2) =>
//         v1 !== '' && v2 !== '' && !isNaN(v1) && !isNaN(v2) ? v1 - v2 : v1.toString().localeCompare(v2)
//     )(getCellValue(asc ? a : b, idx), getCellValue(asc ? b : a, idx));

// document.querySelectorAll('th').forEach(th => th.addEventListener('click', (() => {
//     const table = th.closest('table');
//     Array.from(table.tBodies[0].querySelectorAll('tr:nth-child(n+1)')) 
//         .sort(comparer(Array.from(th.parentNode.children).indexOf(th), this.asc = !this.asc))
//         .forEach(tr => table.tBodies[0].appendChild(tr));
// })));

const SORT_BY_DATE = "datesrt";


function mouseOver(element) {
    element.style.background = "lightblue";
    // "royalblue";
    // aliceblue; // vaalea
    // cornflowerblue; // tumma
}

function mouseOut(element) {
    element.style.background = "initial";
}

function getCellValue(tr, idx) {
    return tr.children[idx].innerText || tr.children[idx].textContent.trim();
}

function compare(v1, v2) {
    return v1 !== '' && v2 !== '' && !isNaN(v1) && !isNaN(v2) ? v1 - v2 : v1.toString().localeCompare(v2);
}

function numberCompare(v1, v2) { // testiä 
    return v1 - v2 ;
}

function dateCompare(a, b) {
    const DATE_RE = /^(\d\d?)[\/\.-](\d\d?)[\/\.-]((\d\d)?\d\d)$/;

    var mtch, d, m, y, dt1, dt2;
    mtch = a.match(DATE_RE);
    d = mtch[1];
    m = mtch[2];
    y = mtch[3];
    if (m.length == 1) m = '0' + m;
    if (d.length == 1) d = '0' + d;
    dt1 = y + m + d;
    mtch = b.match(DATE_RE);
    d = mtch[1];
    m = mtch[2];
    y = mtch[3];
    if (m.length == 1) m = '0' + m;
    if (d.length == 1) d = '0' + d;
    dt2 = y + m + d;
    if (dt1 == dt2) return 0;
    if (dt1 < dt2) return -1;
    return 1;
};

function comparer(idx, asc) {
    return (a, b) => compare(getCellValue(asc ? a : b, idx), getCellValue(asc ? b : a, idx));
}

function newcomparer(col, reverse) {
    return (a, b) => reverse * compare(getCellValue(a, col), getCellValue(b, col));
}

function datecomparer(col, reverse) {
    return (a, b) => reverse * dateCompare(a.children[col].textContent.trim(), b.children[col].textContent.trim());
}

function sortTable(table, col, reverse) {
    // `<tbody>` jolloin ei tule mukaan `<thead>` eikä `<tfoot>` rivit
    Array.prototype.slice.call(table.tBodies[0].rows, 0)
        .sort(newcomparer(col, reverse *= -1))
        .forEach(tr => table.tBodies[0].appendChild(tr));
}

function sortTableDate(table, col, reverse) {
    Array.prototype.slice.call(table.tBodies[0].rows, 0)
        .sort(datecomparer(col, reverse *= -1))
        .forEach(tr => table.tBodies[0].appendChild(tr));
}

function makeSortable(table) {
    var th = table.tHead;
    var i;
    th && (th = th.rows[0]) && (th = th.cells);
    if (th) i = th.length;
    else return; // ei ole `<thead>` --> ei tehdä mitään
    while (--i >= 0)(function (i) {
        var dir = 1;
        if (th[i].className.match(SORT_BY_DATE)) {
            th[i].addEventListener('click', () => sortTableDate(table, i, (dir *= -1)));
        } else {
            th[i].addEventListener('click', () => sortTable(table, i, (dir *= -1)));
        }
        th[i].title = "lajittele";
        th[i].addEventListener('mouseover', () => mouseOver(th[i]));
        th[i].addEventListener('mouseout', () => mouseOut(th[i]));
    }(i));
}

function makeChoosable(tableid) { 
    var table = document.getElementById(tableid);
    var th = table.tHead;
    var i, kentan_nimi;
    th && (th = th.rows[0]) && (th = th.cells);
    if (th) i = th.length;
    else return; // ei ole `<thead>` --> ei tehdä mitään
    while (--i >= 0)(function (i) {
        // if (th[i].className.match(SORT_BY_DATE)) {0
    	kentan_nimi = th[i].innerHTML.trim();
		if (kentan_nimi.length > 0 ) {
 		//console.log("makeChoosable",i, kentan_nimi);
	        th[i].innerHTML += '<select id="select'+i+'" onChange="choose(`'+kentan_nimi+'`, '+i+')"></select>';
	        addSelectOptions(table, i);
	        document.getElementById("select"+i).addEventListener("click", function (event) { event.stopPropagation(); });
        } else {
			console.log("tyhjää kentän nimeä ei käytetä rajauksessa",i, kentan_nimi);
        }
    }(i));	
}

function choose(kentta,i) {
	var opt = document.getElementById('select'+i).options;
	console.log("choose", kentta, i, opt.selectedIndex, opt[opt.selectedIndex].selected, opt[opt.selectedIndex].value);
}

function addSelectOptions(table, col) {
	var options = new Set();
	var myList;
    var th = table.tHead;

    th && (th = th.rows[0]) && (th = th.cells); // hakee headerin ensimmäisen rivin solut

	document.getElementById('select'+col).innerHTML = "<option>kaikki</option>";
	Array.prototype.forEach.call(table.tBodies[0].rows, function (item) {
		options.add(item.children[col].textContent.trim());
	}); 

	// lajitellaan vähän eri tavalla tyypistä riippuen
	if (th[col].className.match(SORT_BY_DATE)) {
		myList = Array.from(options).sort(dateCompare);
 	} else {
		myList = Array.from(options).sort(compare);
	}
	//console.log("addSelectOptions", col, myList);
	
	for (const m of myList) {
		document.getElementById('select'+col).innerHTML += '<option>'+m+'</option>';
	}
}

function makeAllSortable(parent) {
    parent = parent || document.body;
    var t = parent.getElementsByTagName('table'),
        i = t.length;
    while (--i >= 0) makeSortable(t[i]);
}

//----------------------------------------------------------------------------------------
