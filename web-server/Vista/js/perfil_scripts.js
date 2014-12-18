/**
 *
 */

$(document).ajaxComplete(function() {
	var $label = $("#user_name label";
	var text = $label.text();
	$label.text(text.replace("Nombre", "my text")); 
});