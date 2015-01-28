$(document).ready(function() {
  var $like = $('.like-button');

  $like.on('submit', 'form.like', function(event) {
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      url: $target.attr('action'),
      type: 'post',
      data: $target.serialize()
    })
    .done(function(response) {
      $target.closest('.show-photo').find('.like-count span').html(response);
      console.log(response);
    });
  });
});
