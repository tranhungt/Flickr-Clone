$(function(){

  $('#add_photo').click(function(event){
    console.log('add photo click')
    var template = JST['add_photo']();
    $('#photo_form').append(template);
  })
})
