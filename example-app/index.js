var http = require('http')
http.createServer(function (req, res) {
  res.end('hello filthy world')
}).listen(process.env.PORT || 8080, function () {
  console.log('server listenening on port ' + this.address().port)
})
