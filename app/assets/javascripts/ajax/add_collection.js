$(function(){
  var titles = [];
  var hash = {};
  var templateFn = JST['add_collection']
  $('#collection_input').autocomplete({
                          source: getList(),
                          appendTo: '#collections',
                          autoFocus: true
  });

  function getList(){
    $.ajax({
      type: "GET",
      url: "/collections/user_collections",
      success: function(data){
        var collections = $(data);
        _(collections).each(function(collection){
          titles.push(collection.title)
          hash[collection.title] = collection.id;
        })
        console.log(titles)
        console.log(hash)
        console.log(hash['asdf'] == undefined)
      }
    })
    return titles;

  }
  $('#collection_input').keydown(function (e){
    if(e.keyCode == 13 && this.value != ''){
      console.log(this.value);
      var template = templateFn({collection_title: this.value, collection_id: hash[this.value]})
      $('#collections_list').append(template);
      this.value = '';
    }
  })
})