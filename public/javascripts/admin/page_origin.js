document.observe('dom:loaded', function() {
  
  when('path_slug', function(path) {
    var slug = $('page_slug');
    if (!slug) return;
    console.log("hooking up path_slug:", path, " to page slug:", slug);
    
    new Form.Element.Observer(slug, 0.15, function() {
      path.update(slug.value);
    });
  });
 
});