$(document).ready(function(){
	
	$('#essaie').click(function(e){
		e.preventDefault();
		$('.modal').show();
	});


	$('.modal').click(function(e){
		if ($(e.target).hasClass('modal') || $(e.target).hasClass('close') || $(e.target).hasClass('x-char') || $(e.target).hasClass('close-modal')) {
		 	$('.modal').hide();
		}
	});
});