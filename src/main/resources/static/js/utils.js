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

function mouseOver(element) {
    element.style.background = "royalblue";
    //     color: aliceblue; // vaalea
    // color: cornflowerblue; // tumma
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

function comparer(idx, asc) {
    return (a, b) => compare(getCellValue(asc ? a : b, idx), getCellValue(asc ? b : a, idx));
}

function newcomparer(col, reverse) {
    return (a, b) => reverse * compare(getCellValue(a, col), getCellValue(b, col));
}

function sortTable(table, col, reverse) {
    // `<tbody>` jolloin ei tule mukaan `<thead>` eikä `<tfoot>` rivit
    Array.prototype.slice.call(table.tBodies[0].rows, 0)
        .sort(newcomparer(col, reverse *= -1))
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
        th[i].addEventListener('click', () => sortTable(table, i, (dir *= -1)));
        th[i].title = "lajittele";
        th[i].addEventListener('mouseover', () => mouseOver(th[i]));
        th[i].addEventListener('mouseout', () => mouseOut(th[i]));
    }(i));
}

function makeAllSortable(parent) {
    parent = parent || document.body;
    var t = parent.getElementsByTagName('table'),
        i = t.length;
    while (--i >= 0) makeSortable(t[i]);
}

//----------------------------------------------------------------------------------------
