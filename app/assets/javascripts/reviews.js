$(document).ready(function(){
	$('.new_review').on('submit', function(event){
		event.preventDefault();
		$.post($(this).attr('action'), $(this).serialize());
			$('ul.reviews').append('<li>' +)
	})
})