
var express = require('express'),
    app = express();

var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
var db = require('./models/'); 


app.use(express.static('public'));

app.get('/', function (req, res) {
  res.sendFile('views/index.html' , { root : __dirname});
});


app.get('/api/shops', function(req, res) {
   db.Pokemon.find(function(err, shops){
      if (err) { return console.log("index error: " + err); }
      res.json(shops);
  });
});

app.get('/api/shops/:id', function (req, res) {
  db.Pokemon.findOne({_id: req.params.id }, function(err, data) {
    res.json(data);
  });
});

app.post('/api/shops', function (req, res) {
  var newShop = req.body;
  console.log(newShop);

db.Pokemon.create(newShop, function(err, shop){
    if (err){
      res.send("Error " + err);
    }
    res.json(shop);
  });
});

app.put('/api/shops/:id', function update(req, res) {
  var updateID = req.params.id;
  var update = req.body;
  db.Pokemon.findOneAndUpdate({_id: updateID}, update, function(err, shop){
    if (err) { return console.log("create error: " + err); }
    res.json(shop);
  });
});


app.delete('/api/shops/:id', function (req, res) {
  var shopId = req.params.id;
  db.Pokemon.findOneAndRemove({ _id: shopId }, function (err, deletedShop) {
    res.json(deletedShop);
  });
});


// listen on port 3000
app.listen(process.env.PORT || 3000, function () {
  console.log('Express server is up and running on http://localhost:3000/');
});
