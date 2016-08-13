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

	// $(document).on("click", "div.new_form_properties",function(){		
	//  divtoshow = '<div style="height: 250px; width: 400px;">'
 //            + '<h2>Create Users</h2>'
 //            + '<form action= "posts" action= "/posts" method="post">'
 //            +'Name: <input type="text" , name="name" /><br>'
 //            +'Title: <input type="text" name="title" />'
 //            +'textarea <textarea rows="4" cols="50"></textarea>'
	// 		+'</form>'
 //            + '<br /><br /><input type="submit" value="submit" onclick="javascript:$.fancybox.close();" />'
 //            + '</div>';

 //  			//divtoshow =  $("div.new_form_properties").append("<%= escape_javascript(render partial: 'posts/form') %>"); 

 //        //Show fancybox
 //        $.fancybox(
 //            divtoshow,
 //            {
 //                'modal'     : true
 //                , 'height'  : 250
 //                , 'width'   : 400
 //            }
 //        );

 //    }); 

 $("#new_post").bind("submit", function() {

  if ($("#post_name").val().length < 1 || $("#post_title").val().length < 1) {
      $("#login_error").show();
      $.fancybox.resize();
      return false;
  }

  $.fancybox.showActivity();
  var data_url = $(this).closest('form').attr("action");
  $.ajax({
    type    : "POST",
    cache : false,
    url   : data_url,
    data    : $(this).serializeArray(),
    success: function(data) {
      $.fancybox(data);
    }
  });

  return false;
});


  // $("form").submit(function(event){
  //   event.preventDefault();
  //       var form = $(this).closest("form");
  //       var data = form.serializeArray();
  //       var data_url = form.attr('action');
  //         $.ajax({
  //             method:'post',
  //             url: data_url,
  //             data:data,
  //             success: function(data)
  //             {
  //               alert(data);
  //             },
  //             error: function(error)
  //             {
  //               alert(error);
  //             }

  //         });
  // });

});

 

       