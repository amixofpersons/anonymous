$(document).ready(function(){
  $('.menu-toggle').on('mouseenter',function() {
    $('.nav-list').css('display', 'inline')
  });

  $('.menu-toggle').bind('mouseleave', function(){
    $('.nav-list').css('display', 'inline')
    $('.nav-list').hide();
  });
});
