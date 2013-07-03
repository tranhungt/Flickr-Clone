$(function(){
  $('#add_collection').click(function(event){
    var template = JST['add_collection']();
    $('#photo_form').append(template);
  })

})