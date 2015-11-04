$(document).ready(function() {

  toggleRecipe();

  var domElement = $("#recipe_scroll");
  var domElement2 = $("#recipe_image");

  var myTimer = setInterval(function(){
    toggleRecipe();
  }, 4000);

  function toggleRecipe() {
    $.ajax({
      dataType: 'json',
      url: '/recipes/get_random_recipe',
      success: function(data){
        domElement.html("<a href='/recipes/" + data.id + "'><h2>" + data.title + " " + "by " + data.author + "</h2></a>");
        domElement2.html("<a href='/recipes/" + data.id + "'><img src='" + data.image + "height='200' width='200' '></a>");
      },
      error: function(){
        domElement.html("No response. The server may be down.");
      }
    });
  };

});
