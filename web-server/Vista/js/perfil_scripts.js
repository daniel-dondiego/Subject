$(document).ready(function() {

    /* Obtiene los datos del header del perfil */
    var request = $.ajax({'url':'/perfil/get_contenido_perfil','data':{'funcion': 'get_datos'}});
    request.done(function(response){        
        $('#user_name').text(response.nombre);
        $('#birthday').text(response.edad);
        $('#foto_perfil').html(response.foto);
    });
    request.fail(function(jqXHR, textStatus) {
        alert('Error al cargar los elementos.');
    });

    /* Obtiene el código html de la pestaña de información en el perfil */
    $('#button_info').click(function(){
        var info_request = $.ajax({'url':'/perfil/get_contenido_perfil','data':{'funcion':'get_info'}});
        info_request.done(function(response){
            $('#publicacion_nueva').html(response);
        });
        inf_request.fail(function(jqXHR, textStatus){
            alert('Error al cargar la información.');        
        });
    });

    /* Obtiene el código html de la pestaña de publicaciones en el perfil */
    $('#button_publicaciones').click(function(){
        var publicaciones_request = $.ajax({'url':'/perfil/get_contenido_perfil','data':{'funcion':'get_publicaciones'}});
        publicaciones_request.done(function(response){
            $('#publicacion_nueva').html(response);
        });
        publicaciones_request.fail(function(jqXHR, textStatus){
            alert('Error al cargar las publicaciones.'); 
        });
    });

});
