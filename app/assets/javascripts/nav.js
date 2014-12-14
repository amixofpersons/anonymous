$(document).ready(function(){
  $('.menu-toggle').mouseover(function() {
    $('.nav-list').show();
  });

  $('.menu-toggle').mouseleave(function(){
    $('.nav-list').css('display', 'none')
  });
});
