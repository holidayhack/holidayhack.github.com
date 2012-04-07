
// app.js - start node static site
(function() {

  var WEBROOT = './public'
    , PORT = process.env.PORT || 8808;

  var files = new (require('node-static').Server)(WEBROOT);

  console.log('Starting static file server on port ' + PORT + '...');
  require('http').createServer(function(req, resp) {
    req.addListener('end', function() {
      files.serve(req, resp);
    });
  }).listen(PORT);

})();
