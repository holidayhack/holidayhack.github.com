
// app.js - start node static site
(function() {

  var WEBROOT = './public'
    , PORT = process.env.PORT || 8808;

  var files = new (require('node-static').Server)(WEBROOT);

  require('http').createServer(function(req, resp) {
    request.addListener('end', function() {
      files.serve(req, resp);
    });
  }).listen(PORT);

})();
