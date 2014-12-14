$(document).ready(function(){

  $('.menu-toggle').on('mouseenter',function() {
    console.log("I'm still hovering!")
    $('.nav-list').css('display', 'inline')
  });

  $('.menu-toggle').bind('mouseleave', function(){
    console.log("I've left this menu!")
    $('.nav-list').css('display', 'inline')
    $('.nav-list').hide();
  });
});
