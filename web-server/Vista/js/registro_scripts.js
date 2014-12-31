$(document).ready(function() {

	var request = $.ajax({'url':'/get_lista_paises'});
	request.done(function(response){      		
        $('#pais_origen').html(response);
    });
    request.fail(function(jqXHR, textStatus) {
        alert('Error al cargar los elementos.');
    });

    request = $.ajax({'url':'/get_lista_escuelas'});
	request.done(function(response){      		
        $('#escuela_s').html(response);
    });
    request.fail(function(jqXHR, textStatus) {
        alert('Error al cargar los elementos.');
    });
});