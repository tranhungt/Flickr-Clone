$(function(){
  $('#add_collection').on('ajax:success', function(event, data){
    console.log($(data))
    var collection = $(data)[0]
    var templateFn = JST['add_collection'];
    var template = templateFn({collection: collection})
    $('#collections_select').append(template);
    $('#collection_title_field').val('');
  })
})