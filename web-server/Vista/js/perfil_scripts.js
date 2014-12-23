$(document).ready(function() {

    /* Obtiene los datos del header del perfil */
    var request = $.ajax({'url':'/get_nombre'});
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
        var info_request = $.ajax({'url':'/get_info'});
        info_request.done(function(response){
            $('#publicaciones_usuario').html(response);
        });
        inf_request.fail(function(jqXHR, textStatus){
            alert('Error al cargar la información.');        
        });
    });

});
