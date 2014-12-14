$(document).ready(function(){
  $('.menu-toggle').mouseenter(function() {
    $('.nav-list').css('display', 'inline')
  });

  $('.menu-toggle').mouseleave(function(){
    $('.nav-list').css('display', 'none')
  });
});
