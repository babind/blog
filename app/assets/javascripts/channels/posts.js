$(function(){
	$("form").submit(function(event){
		event.preventDefault();
		var action = $(this).attr('action');
		var method = $(this).attr('method');
		
		var data = $(this).serializeArray();
		
		$.ajax({
			method: method,
			url: action,
			data: data,

			dataType: 'script'
		});


	});


 $("#new_post").bind("submit", function() {

  if ($("#post_name").val().length < 1 || $("#post_title").val().length < 1) {
      $("#login_error").show();
      $.fancybox.resize();
      return false;
  }

  $.fancybox.showActivity();
  var data_url = $(this).closest('form').attr("action");
  var this_data = $(this).serializeArray();
  $.ajax({
    type    : "POST",
    cache : false,
    url   : data_url,
    data    : this_data,
    success: function(data) {
      $.fancybox(data);
    }
  });

  return false;
});

});

 

       