$(document).ready(function(){
	

	var time_var = setInterval(myTimer, 1000);
    var date_var = setInterval(myDate, 1000);

    function myTimer() {
        var d = new Date();
        document.getElementById("time").innerHTML = d.toLocaleTimeString();
    }

    function myDate() {
      var d = new Date();
      document.getElementById("date").innerHTML = dateFormat(d, "dddd, mmmm dS, yyyy");
    }

    $("#menu").accordion({collapsible: true, active: false});
    $(document).tooltip();
    


/*

$("form").on("submit",function(event){
   event.preventDefault();
   console.log($(this).serialize());

   $.post("/create",$(this).serialize)
    .done(function(data){
      var url = $.parseJSON(data)
      $('#display_table').append('<tr><td<td>
      	<a href=\"'url.id'\">');

    });
});

*/

  $("#url_form").submit(function(event){
    event.preventDefault();
    $.ajax({
          method: 'POST',  
          url: '/create',
          dataType: 'JSON',
          data: $(this).serialize(),
          success: function(data){
            $("#display_table").append("<tr>" +
              "<td>"+  data.id  + "</td> " +
                "<td>"+  "<a href= "+  data.long_url_text + "  >"  + data.long_url_text + "</a></td>" +
                "<td>"+  "<a href= /" + data.short_url_text +   " >"  + data.short_url_text + "</a></td>" +
                "<td>"+  data.click_count  + "</td>" + 
              "</tr>");

            $("#short_url").append("<a href= /" + data.short_url_text +   " >"  + data.short_url_text + "</a>");
          }
    });
  });

});