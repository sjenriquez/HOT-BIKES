$(document).ready(function() {
  $('#like').click(event)
    event.preventDefault();

    $like = $(event.target);
    $.ajax({
      url: $like.attr('action'),
      type: $like.attr('method'),
      data: $like.serialize()
    })
    .done(function(response) {
      $()
    })

});
