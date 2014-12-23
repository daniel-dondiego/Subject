/**
 * Carga los datos principales de un usuario
 */
$(document).ready(function() {
    var request = $.ajax({'url':'/get_nombre'});
    request.done(function(response){        
        $('#user_name').text(response.nombre);
        $('#birthday').text(response.edad);
    });
    request.fail(function(jqXHR, textStatus) {
        alert('Request failed: ' + textStatus);
    });     
});
