$(document).on("turbolinks:load", function(){
	$("#start_date").datepicker({format: 'dd-mm-yyyy'});
	var size ;
	$('body').on('change', '#size', function() {
		size = $('#size').val();
	});

$('.chosen-select').chosen({
    allow_single_deselect: true,
    max_selected_options: size,
    no_results_text: 'No results matched',
    width: '300px'
  });
  });