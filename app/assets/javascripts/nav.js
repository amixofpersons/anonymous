$(document).ready(function(){
  $('.nav-list').hide();

  $('.menu-toggle').mouseenter(function(event){
    event.preventDefault();
    $('.nav-list').show();
  });

  $('.menu-toggle').mouseout(function(event){
    $('.nav-list').hide();
  });
});
