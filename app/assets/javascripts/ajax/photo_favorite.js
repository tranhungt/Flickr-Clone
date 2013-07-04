
$(function(){
  $('.favorite_form').on('ajax:success', function(event){
    event.preventDefault();
    $(event.currentTarget).toggleClass('hidden');
    $(event.currentTarget).siblings().toggleClass('hidden');
  });
})
