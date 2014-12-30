$(document).ready(function() {	
	var request = $.ajax({'url':'/get_escuelas_paises'});
	request.done(function(response){        
        $('#escuela_s').html(response.escuela);
        $('#pais_origen').html(response.pais);
    });
    request.fail(function(jqXHR, textStatus) {
        alert('Error al cargar los elementos.');
    });
});