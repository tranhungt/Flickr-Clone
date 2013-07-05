$(function(){

  $('#add_photo').click(function(event){
    console.log('add photo click')
    var template = JST['add_photo']();
    $('#add_photo_div').append(template);
  })
})
