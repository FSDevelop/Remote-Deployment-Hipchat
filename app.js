/* Running deployment app */

var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var spawn = require('child_process').spawn;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

app.listen(8080, function() {
  console.log("Listening to port 8080");
});

app.post('/deploy', function(req, res) {
  var from = req.body.item.message.from.mention_name;
  if (from == 'JohnDoe' || from == 'DonaldTrump') {
    var sh = spawn('sh', [ 'deploy.sh' ]);
  } else {
    var sh = spawn('sh', [ 'unauthorized.sh' ]);
  }
});
