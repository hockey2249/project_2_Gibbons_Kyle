class PokemonGym < Sinatra::Base
set :method_override, true

require 'json'

get '/' do
  erb :index
end

get '/map' do
  @pokemons = Pokemon.all
  erb :map
end

get '/pokemon-list' do
  erb :pokemon_list
end

get '/about' do
  erb :about
end

get '/admin' do 
	erb :admin
end
end