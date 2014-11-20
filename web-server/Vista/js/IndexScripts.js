/**
 * @fileoverview Contiene las funciones necesarias para el archivo index.html .
 */


/**
 * Reacomoda el elipse del logo cuando el ancho de la ventana del navegador es modificado.
 */
window.onresize = function reacomodaElipses() {
					if ((window.innerWidth >= 100) && (window.innerWidth < 480)) {		
						document.getElementById('elipseNegro').setAttribute('cx',30);
						document.getElementById('elipseNegro').setAttribute('cy',85);
						document.getElementById('elipseNegro').setAttribute('rx',7.5);
						document.getElementById('elipseNegro').setAttribute('ry',6.5);
						document.getElementById('elipseAzul').setAttribute('cx',30);
						document.getElementById('elipseAzul').setAttribute('cy',85);
						document.getElementById('elipseAzul').setAttribute('rx',6);
						document.getElementById('elipseAzul').setAttribute('ry',4.5);
					} else if ((window.innerWidth >= 480) && (window.innerWidth < 767)) {
 						document.getElementById('elipseNegro').setAttribute('cx',38);	
						document.getElementById('elipseNegro').setAttribute('cy',78);
						document.getElementById('elipseNegro').setAttribute('rx',9.5);
						document.getElementById('elipseNegro').setAttribute('ry',8.5);
						document.getElementById('elipseAzul').setAttribute('cx',38);
						document.getElementById('elipseAzul').setAttribute('cy',78);
						document.getElementById('elipseAzul').setAttribute('rx',8);
						document.getElementById('elipseAzul').setAttribute('ry',6.5);	
					} else if ((window.innerWidth >= 767) && (window.innerWidth < 950)) {
    					document.getElementById('elipseNegro').setAttribute('cx',38);	
						document.getElementById('elipseNegro').setAttribute('cy',76);
						document.getElementById('elipseNegro').setAttribute('rx',10.5);
						document.getElementById('elipseNegro').setAttribute('ry',9.5);
						document.getElementById('elipseAzul').setAttribute('cx',38);
						document.getElementById('elipseAzul').setAttribute('cy',76);
						document.getElementById('elipseAzul').setAttribute('rx',8.6);
						document.getElementById('elipseAzul').setAttribute('ry',7.1);
					} else {
						document.getElementById('elipseNegro').setAttribute('cx',50);	
						document.getElementById('elipseNegro').setAttribute('cy',66);
						document.getElementById('elipseNegro').setAttribute('rx',11.5);
						document.getElementById('elipseNegro').setAttribute('ry',10.5);
						document.getElementById('elipseAzul').setAttribute('cx',50);
						document.getElementById('elipseAzul').setAttribute('cy',66);
						document.getElementById('elipseAzul').setAttribute('rx',9.6);
						document.getElementById('elipseAzul').setAttribute('ry',8.1);
					}
				}

/**
 * Coloca los elipses del logo dependiendo del tamaño de la ventana del navegador al 
 * cargar por primera vez la página.
 */
function colocaElipses() {
	if ((window.innerWidth >= 100) && (window.innerWidth < 480)) {		
		document.getElementById('elipseNegro').setAttribute('cx',30);
		document.getElementById('elipseNegro').setAttribute('cy',85);
		document.getElementById('elipseNegro').setAttribute('rx',7.5);
		document.getElementById('elipseNegro').setAttribute('ry',6.5);
		document.getElementById('elipseAzul').setAttribute('cx',30);
		document.getElementById('elipseAzul').setAttribute('cy',85);
		document.getElementById('elipseAzul').setAttribute('rx',6);
		document.getElementById('elipseAzul').setAttribute('ry',4.5);
	} else if ((window.innerWidth >= 480) && (window.innerWidth < 767)) {
 		document.getElementById('elipseNegro').setAttribute('cx',38);	
		document.getElementById('elipseNegro').setAttribute('cy',78);
		document.getElementById('elipseNegro').setAttribute('rx',9.5);
		document.getElementById('elipseNegro').setAttribute('ry',8.5);
		document.getElementById('elipseAzul').setAttribute('cx',38);
		document.getElementById('elipseAzul').setAttribute('cy',78);
		document.getElementById('elipseAzul').setAttribute('rx',8);
		document.getElementById('elipseAzul').setAttribute('ry',6.5);	
	} else if ((window.innerWidth >= 767) && (window.innerWidth < 950)) {
    	document.getElementById('elipseNegro').setAttribute('cx',38);	
		document.getElementById('elipseNegro').setAttribute('cy',76);
		document.getElementById('elipseNegro').setAttribute('rx',10.5);
		document.getElementById('elipseNegro').setAttribute('ry',9.5);
		document.getElementById('elipseAzul').setAttribute('cx',38);
		document.getElementById('elipseAzul').setAttribute('cy',76);
		document.getElementById('elipseAzul').setAttribute('rx',8.6);
		document.getElementById('elipseAzul').setAttribute('ry',7.1);
	} else {
		document.getElementById('elipseNegro').setAttribute('cx',50);	
		document.getElementById('elipseNegro').setAttribute('cy',66);
		document.getElementById('elipseNegro').setAttribute('rx',11.5);
		document.getElementById('elipseNegro').setAttribute('ry',10.5);
		document.getElementById('elipseAzul').setAttribute('cx',50);
		document.getElementById('elipseAzul').setAttribute('cy',66);
		document.getElementById('elipseAzul').setAttribute('rx',9.6);
		document.getElementById('elipseAzul').setAttribute('ry',8.1);
	}
}						
					