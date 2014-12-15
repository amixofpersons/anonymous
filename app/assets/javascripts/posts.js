$(document).ready(function(){
  $(".homepage").on('click', "#new-secret-link",function(event){
    event.preventDefault();
  });

  $(".homepage").on('submit', function(event){
    event.preventDefault();
  })
});
