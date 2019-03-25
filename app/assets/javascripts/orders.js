$(document).on('turbolinks:load', function (){

  $('body').on('change','table#order_line_items input:text', function(e){
      cal();
      e.preventDefault(); 
    });

   function cal(){
   	var qunt = 0;
   	var amount = 0;
   	var unit_cost =0;
   	  var i = 0;

   	qunt = $('table#order_line_items #quantity').val();
    unit_cost = $('table#order_line_items #unit_rate').val();
    amount = (qunt * unit_cost);
    $('table#order_line_items #total').val(amount.toFixed(2));
   }
    
  });