class PokemonGym < Sinatra::Base
require 'json'

  #Get all Pokemon list 

get '/pokemon-gym' do
     @pokemons = Pokemon.all.to_json
  end

  #create pokemon pin to drop on the map 

post '/index' do
	pokemon = params[:pokemon]
	new_pokemon = Pokemon.create(pokemon)	
	p new_pokemon
	redirect to('/home')
  end

end
