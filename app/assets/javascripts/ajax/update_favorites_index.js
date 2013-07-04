
$(function(){
  $('#favorites_index').on('ajax:success', function(event){
    event.preventDefault();
    var photo_id = $(this).find('#favorite_photo_id').val()
    var parent_div = $('#div' + photo_id)
    parent_div.parents('li:first').remove();
  });
})
