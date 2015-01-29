$(document).ready(function() {
  var $like = $('.like');
  var $del = $('.delete-form');
  // var $edit = $('.edit');

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

  // $edit.on('click', function(event) {
  //   event.preventDefault;
  //   var $editLink = $(event.target);

  //   $editLink.closest('.show-photo').find('.title').html(
  //     <form class="edit-title" action="/photos/<%= photo.id %>" method="post">
  //       <input type="hidden" name="_method" value="put">
  //       <input type="text" name="title" value="<%= photo.title %>">
  //       <input type="submit" value="Edit title">
  //     </form>
  //     );
  //   }
  // }


});


