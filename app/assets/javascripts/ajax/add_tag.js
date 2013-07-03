$(function(){
  $('#add_tag').click(function(event){
    var template = JST['add_tag']();
    $('#photo_form').append(template);
  })

})