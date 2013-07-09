  $(function(){
  $('#tag_search_input').autocomplete({
                          source: getList(),
                          minLength: 0,
                          appendTo: '#custom-search-form',
                          autoFocus: true
  });

  

  function getList(){
    var titles = [];
    var hash = {};
    $.ajax({
      type: "GET",
      url: "/tags",
      success: function(data){
        var tags = $(data);
        _(tags).each(function(tag){
          titles.push(tag.title)
          hash[tag.title] = tag.id;
        })
      }
    })
    console.log(titles)
    return titles;

  }
  
})
