require 'rubygems'
require 'bundler'
Bundler.require

# Models
require './models/pokemon_gym'

#Controllers
require './app'
require './controllers/pokemon_gym_controller'

run PokemonGym