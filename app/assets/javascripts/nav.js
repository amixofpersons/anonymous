$(document).ready(function(){
  $('.nav-list').hide();

  $('.menu-toggle').mouseover(function(event) {
    event.preventDefault();
    $('.nav-list').show();
  });

  $('.menu-toggle').mouseout(function(event){
    $('.nav-list').hide();
  });
});
