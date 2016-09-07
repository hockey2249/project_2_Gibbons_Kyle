require 'rubygems'
require 'bundler'
Bundler.require

# Models
require './models/pokemon_gym'
require './models/pokemon_ad'
require './models/pokemon_description'

#Controllers
require './app'
require './controllers/pokemon_gym_controller'
require './controllers/pokemon_ad_controller'
require './controllers/pokemon_description_controller'


run PokemonGym