var express = require('express');
var app = express();

app.get('/hello', function(req, res){
  //res.send('Hello World');

var Client = require('node-rest-client').Client;

client = new Client();

//direct way
client.get("http://dacrib.net/yomama", function(data, response){
	//parsed response body as js object
	//console.log(data);
	//raw response
	res.send(data);
	console.log(response);
});

});

var server = app.listen(3000, function() {
    console.log('Listening on port %d', server.address().port);
});