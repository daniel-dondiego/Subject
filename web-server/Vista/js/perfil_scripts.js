/**
 * Carga los datos principales de un usuario
 */
function cargaDatos () {
	
	if(window.XMLHttpRequest)
		peticion_http = new XMLHttpRequest();
	else if(window.ActiveXObject)
		peticion_http = new ActiveXObject("Microsoft.XMLHTTP");

	peticion_http.onreadystatechange = insertaDatos;
	peticion_http.open('GET', '/static/Nombre.txt', true);
	peticion_http.send(null);

	function insertaDatos () {
		if(peticion_http.readyState == 4) {
      		if(peticion_http.status == 200) {
        		document.getElementById("user_name").innerHTML = peticion_http.responseText;        		
        	}
    	}	
	}
}

window.onload = cargaDatos;

    $(function() {
    // When the testform is submitted…
    $("#testform").submit(function() {
        // post the form values via AJAX…
        var postdata = {name: $("#name").val()} ;
        $.post('/submit', postdata, function(data) {
            // and set the title with the result
            $("#title").html(data['title']) ;
           });
        return false ;
        });
    });

