$(document).ready(function() {
  var $like = $('.like');
  var $del = $('.delete-form');
  var $edit = $('.edit');
  var $editSubmit = $('.edit-title')

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

  $edit.on('click', function(event) {
    event.preventDefault();
    var $editLink = $(event.target);

    $editLink.closest('.show-photo').find('.edit-form').show();
    $editLink.closest('.show-photo').find('.title').hide();
  })

  $editSubmit.on('submit', function(event) {
    event.preventDefault();
    var $editForm = $(event.target);

    $editForm.children('input[type=submit]').val("Editing...");

    $.ajax({
      url: $editForm.attr('action'),
      type: 'put',
      data: $editForm.serialize()
    })
    .done(function(response) {
      $editForm.closest('.show-photo').find('.title').show();
      $editForm.closest('.show-photo').find('.edit-form').hide();
      $editForm.closest('.show-photo').find('.title').html(response);
    })
  })


});


