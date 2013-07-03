
$(function(){
  $('.favorite_form').on('ajax:success', function(event){
    console.log(this);
    event.preventDefault();
    $(event.currentTarget).toggleClass('hidden');
    $(event.currentTarget).siblings().toggleClass('hidden');
  });
})
