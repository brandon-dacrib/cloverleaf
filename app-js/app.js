var express = require('express');
var app = express();

app.get('/do/:nodeid/:action', function(req, res){
  var url = req.url;
  var nodeid = req.params.nodeid;
  var action = req.params.action;
  res.send("url: " + url + "\nnodeid: " + nodeid + "\naction: " + action);

var Client = require('node-rest-client').Client;

client = new Client();

//direct way
client.get("http://cloverleaf/" + url, function(data, response){
	//parsed response body as js object
	console.log(data);
	//raw response
	//res.send(data);
	//console.log(response);
	console.log ("request url is: "+ req.url);
	console.log ("nodeid is: "+ nodeid);
	console.log ("action is: "+ action);
});

});

var server = app.listen(3000, function() {
    console.log('Listening on port %d', server.address().port);
});