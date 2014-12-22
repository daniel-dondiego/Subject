/**
 * Carga los datos principales de un usuario
 */
$(document).ready(function() {
    var request = $.ajax({'url':'/get_nombre'});
    request.done(function(response){        
        $('#datos_principales').text(response);
        alert(response);
    });
    request.fail(function(jqXHR, textStatus) {
        alert('Request failed: ' + textStatus);
    });
});
