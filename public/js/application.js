$(document).ready(function() {
  var $like = $('.like');
  var $del = $('.delete-form');

  $like.on('submit', function(event) {
    event.preventDefault();
    var $likeForm = $(event.target);

    $likeForm.children('input[type=submit]').val("Liking...");

    $.ajax({
      url: $likeForm.attr('action'),
      type: 'post',
      data: $likeForm.serialize()
    })
    .done(function(response) {
      $likeForm.closest('.show-photo').find('.like-count span').html(response);
      $likeForm.children('input[type=submit]').val("Liked!");
    });
  });

  $del.on('submit', function(event) {
    event.preventDefault();
    var $deleteForm = $(event.target);

    $deleteForm.children('input[type=submit]').val("Deleting...");

    $.ajax({
      url: $deleteForm.attr('action'),
      type: 'delete'
    })
    .done(function(response) {
      $deleteForm.closest('.show-photo').fadeOut("slow");
    });
  });


});
