$(document).ready(function(){
	var number = parseInt($('p').text(), 10);
	/* Obtiene los datos del header del perfil */
    var request = $.ajax({'url':'/get_contenido_perfil_ext','data':{'funcion':'get_datos','id':number}});
    request.done(function(response){
        $('#user_name').text(response.nombre);
        $('#titulo').text(response.nombre);
        $('#birthday').text(response.edad);
        $('#foto_perfil').html(response.foto);
        $('#escuela_').text(response.escuela);
        if(response.siguea == 'NO'){
        	$('#follow_button').text('Follow');
        }else{
        	$('#follow_button').text('Unfollow')
        	$('#follow_button').css('background-color','red');
        }
    });
    request.fail(function(jqXHR, textStatus) {
        alert('Error al cargar los elementos. ' + jqXHR +"  " + textStatus);
    });    

    /* Obtiene las publicaciones cuando se cargar el perfil por primera vez */
    var publicaciones_inicio = $.ajax({'url':'/get_contenido_perfil_ext','data':{'funcion':'get_publicaciones','id':number}});
    publicaciones_inicio.done(function(response){
        $('#contenido').html(response);
    });
    publicaciones_inicio.fail(function(jqXHR, textStatus){
        alert('Error al cargar las publicaciones.'); 
    });

    /* Obtiene el código html de la pestaña de información en el perfil */
    $('#button_info').click(function(){
        var info_request = $.ajax({'url':'/get_contenido_perfil_ext','data':{'funcion':'get_info' , 'id':number}});
        info_request.done(function(response){
            $('#contenido').html(response);
        });
        info_request.fail(function(jqXHR, textStatus){
            alert('Error al cargar la información.');        
        });
    });

    /* Obtiene el código html de la pestaña de publicaciones en el perfil */
    $('#button_publicaciones').click(function(){
        var publicaciones_request = $.ajax({'url':'/get_contenido_perfil_ext','data':{'funcion':'get_publicaciones', 'id':number}});
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

    $('#follow_div').click(function(){
    	var request_f = $.ajax({'url':'/get_contenido_perfil_ext','data':{'funcion':'get_datos','id':number}});
    	request_f.done(function(response){
        	if(response.siguea == 'NO'){
        		var seguido = $.ajax({'url':'/follow','data' : {'id_seguido': number}});
        		seguido.done(function(resp){
        			if(resp == 'OK'){
        				$('#follow_button').text('Unfollow');
        				$('#follow_button').css('background-color','red');
        			}else{
        				alert('No se pudo seguir en este momento.');
        				$('#follow_button').text('Follow');
        			}
        		});
        		seguido.fail(function(jqXHR,textStatus){
        			alert('No se pudo seguir en este momento...');
        		});
        	}else{
        		var no_seguido = $.ajax({'url':'/unfollow','data' : {'id_seguido': number}});
        		no_seguido.done(function(respo){        			
        			if(respo == 'OK'){
        				$('#follow_button').text('Follow');
        				$('#follow_button').css('background-color','blue');
        			}else{
        				alert('No se pudo dejar de seguir en este momento.');
        				$('#follow_button').text('Unfollow');
        			}
        		});
        		no_seguido.fail(function(jqXHR,textStatus){
        			alert('No se pudo dejar de seguir en este momento...');
        		});
        	}
    	});
    	request_f.fail(function(jqXHR, textStatus) {
        	alert('Error al leer la base de datos.');
    	});  
    });

});