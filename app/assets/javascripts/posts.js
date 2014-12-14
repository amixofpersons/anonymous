$(document).ready(function(){
  $(".secrets").on('click', "#new-secret-link",function(event){
    event.preventDefault();
    $target = $(event.target);

    $.ajax({
      type: 'GET',
      url: $target.attr('href'),
      data: $target.serialize()
    }).done(function(response){
      $target.parent().html(response)
    });
  });
});
