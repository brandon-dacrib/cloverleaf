var express = require('express');
var app = express();


app.get('/api/:call/:item?/:action?', function(req, res){
  var url = req.url;
  var call = req.params.call;
  var item = req.params.item;
  var action = req.params.action;
  res.send("url: " + url + "\nitem: " + item + "\naction: " + action);

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
		//console.log(response);
	});

	break;

	case 'say':
	console.log ("the call is say");
	console.log ("the item is "+ item);
	console.log ("request url is: "+ req.url);
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

//var Client = require('node-rest-client').Client;
//client = new Client();

//direct way
//client.get("http://cloverleaf/" + url, function(data, response){
	//parsed response body as js object
	//console.log(data);
	//raw response
	//res.send(data);
	//console.log(response);
//	console.log ("request url is: "+ req.url);
//	console.log ("item is: "+ item);
//	console.log ("action is: "+ action);
//});

});

var server = app.listen(3000, function() {
    console.log('Listening on port %d', server.address().port);
});