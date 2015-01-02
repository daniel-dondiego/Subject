$(document).ready(function(){
	/* Obtiene las publicaciones cuando se cargar el perfil por primera vez */
    var publicaciones_inicio = $.ajax({'url':'/get_publicaciones_inicio'});
    publicaciones_inicio.done(function(response){
    	alert(response);
        $('#contenido').html(response);
    });
    publicaciones_inicio.fail(function(jqXHR, textStatus){
        alert('Error al cargar las publicaciones.'); 
    });

});