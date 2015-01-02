$(document).ready(function() {

    /* Obtiene los datos del header del perfil */
    var request = $.ajax({'url':'/perfil/get_contenido_perfil','data':{'funcion': 'get_datos'}});
    request.done(function(response){ 
        $('#user_name').text(response.nombre);
        $('#titulo').text(response.nombre);
        $('#birthday').text(response.edad);
        $('#foto_perfil').html(response.foto);
        $('#escuela_').text(response.escuela);        
    });
    request.fail(function(jqXHR, textStatus) {
        alert('Error al cargar los elementos.');
    });    

    /* Obtiene las publicaciones cuando se cargar el perfil por primera vez */
    var publicaciones_inicio = $.ajax({'url':'/perfil/get_contenido_perfil','data':{'funcion':'get_publicaciones'}});
    publicaciones_inicio.done(function(response){
        $('#contenido').html(response);
    });
    publicaciones_inicio.fail(function(jqXHR, textStatus){
        alert('Error al cargar las publicaciones.'); 
    });

    /* Obtiene el código html de la pestaña de información en el perfil */
    $('#button_info').click(function(){
        var info_request = $.ajax({'url':'/perfil/get_contenido_perfil','data':{'funcion':'get_info'}});
        info_request.done(function(response){
            $('#contenido').html(response);
        });
        info_request.fail(function(jqXHR, textStatus){
            alert('Error al cargar la información.');        
        });
    });

    /* Obtiene el código html de la pestaña de publicaciones en el perfil */
    $('#button_publicaciones').click(function(){
        var publicaciones_request = $.ajax({'url':'/perfil/get_contenido_perfil','data':{'funcion':'get_publicaciones'}});
        publicaciones_request.done(function(response){
            $('#contenido').html(response);
        });
        publicaciones_request.fail(function(jqXHR, textStatus){
            alert('Error al cargar las publicaciones.'); 
        });
        
    });

    $('.notificacion_logo').click(function(){
        Notifier.info('You have been informed!');
    });


});

function Verify(objForm) {     
    var arrExtensions=new Array("bmp", "gif", "jpg", "jpeg", "png"); 
    var objInput = objForm.elements["nueva_foto"]; 
    var strFilePath = objInput.value; 
    var arrTmp = strFilePath.split("."); 
    var strExtension = arrTmp[arrTmp.length-1].toLowerCase(); 
    var blnExists = false; 
    for (var i=0; i<arrExtensions.length; i++) { 
        if (strExtension == arrExtensions[i]) { 
            blnExists = true; 
            break; 
        } 
    } 
    if (!blnExists) 
        alert("Por favor ingresa una imagen válida."); 
    return blnExists; 
} 
