$(document).ready(function(){
	$('.btn-outline-primary').click(function(e){
	$('#myCart').removeClass('animated shake');
	console.log("begining of animation");
	console.log("****************");
	$('#myCart').toggleClass('animated shake');
    // $('#myCart').removeClass('animated shake');
    $('#myCart').on('animationend', function(){
			$('#myCart').removeClass("animated shake");
			console.log("end of animation")
		});
});
});