require 'rubygems'
require 'bundler'
Bundler.require

# Models
require './models/pokemon_gym'
require './models/pokemon_ad'

#Controllers
require './app'
require './controllers/pokemon_gym_controller'
require './controllers/pokemon_ad_controller'

run PokemonGym