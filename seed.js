// This file allows us to seed our application with data
// simply run: `node seed.js` from the root of this project folder.

var db = require('./models');

var pokemongym_list = [
  {
    name: "Pokemon Gym: Denver Beer Co.",
    address: "1695 Platte St, Denver, CO 80202",
    website: "http://denverbeerco.com/",
    phone: 3034332739,
  },
  {
    name: "Kyle and Kevin's Local Gym",
    address: "429 Acoma Street, Denver C0",
    website: "http://kyle.com",
    phone: 3034332739,

  }

  ];

db.Pokemon.remove({}, function(err, pokemons){
   if(err) {
    console.log('Error occurred in remove', err);
   } else {
     console.log('removed gym');
    db.Pokemon.create(pokemongym_list, function(err, pokemons){
  if (err) { return console.log('err', err); }
    console.log("created", db.Pokemon.length, "pokemons");
    process.exit();
  });
  }
});
