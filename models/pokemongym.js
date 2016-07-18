var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var PokemonSchema = new Schema({
  name: String,
  address: String,
  website: String,
  phone: Number
});

var Pokemon = mongoose.model('Pokemon', PokemonSchema);

module.exports = Pokemon;