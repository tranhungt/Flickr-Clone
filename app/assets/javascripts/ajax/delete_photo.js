
  $(function(){
    $('.delete_photo_form').on('ajax:success', function(event){
      event.preventDefault()
      $(this).closest('li').remove();
      console.log(this)
      // $(this).parents('li:first').remove();
    })
  })
