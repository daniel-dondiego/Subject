$(document).ready(function(){

	var number = parseInt($('p').text(), 10);
	/* Obtiene los datos del header del perfil */
    var request = $.ajax({'url':'/get_contenido_perfil_ext','data':{'id':number}});
    request.done(function(response){
        $('#user_name').text(response.nombre);
        $('#titulo').text(response.nombre);
        $('#birthday').text(response.edad);
        $('#foto_perfil').html(response.foto);
        $('#escuela_').text(response.escuela);        
    });
    request.fail(function(jqXHR, textStatus) {
        alert('Error al cargar los elementos. ' + jqXHR +"  " + textStatus);
    });    
});