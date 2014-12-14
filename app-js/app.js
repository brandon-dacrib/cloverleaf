var express = require('express');
var app = express();
tts = require('node-tts-api');
var layer = require('player');

app.get('/api/:call/:item?/:action?', function(req, res){
  var url = req.url;
  var call = req.params.call;
  var item = req.params.item;
  var action = req.params.action;
  res.send("\r\nurl: " + url + "\r\nitem: " + item + "\naction: " + action);

switch(call) {
	case 'do':
	console.log ("the call is do");
	console.log ("item is: "+ item);
	console.log ("action is: "+ action);
	console.log ("request url is: "+ req.url);

	var Client = require('node-rest-client').Client;
	client = new Client();
	client.get("http://cloverleaf/api/" + call  + "/" + item + "/" + action + "/", function(data, response){
	//res.send(data);
	//console.log(data);
	});
	break;

	case 'say':
	console.log ("the call is say");
	console.log ("the item is "+ item);
	console.log ("request url is: "+ req.url);
	utter = item;
	tts.getSpeech(utter, function(error, link) {
	return console.log(link);
	});
	break;

	case 'play':
	console.log ("the call is play");
	console.log ("the item is "+ item);
	console.log ("the request url is:"+ req.url);
	break;

	case 'notify':
	console.log ("the call is notify");
	console.log ("the item is "+ item);
	console.log ("the request url is:"+ req.url);

}

});

var server = app.listen(8080, function() {
    console.log('Listening on port %d', server.address().port);
});