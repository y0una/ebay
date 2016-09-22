$(document).ready(function() {
  $("#logout-link").on("click", function(e){
    console.log("click");
    e.preventDefault();

    var request = $.ajax({
      url: '/logout',
      type: 'delete'
    });

    request.done(function(responseData){
      $("#nav-bar").empty();
      $("#nav-bar").html("<a class='login-register' href = '/sessions/new'>Login</a> <a class='login-register' href = '/users/new'>Register</a>");
    });

    request.fail(function(error){
      console.log(error);
    });
  });
});
