# class PokemonGym < Sinatra::Base
# require 'json'

# set :method_override, true

#   #Get all Pokemon list 

# get '/pokemon-gym' do
#      @pokemons = Pokemon.all.to_json 

# end

#   #create pokemon pin to drop on the map 

# post '/index' do
#   pokemon = params[:pokemon]
#   new_pokemon = Pokemon.create(pokemon) 
#   p new_pokemon
#   redirect to('/home')
# end

# get '/pokemon-gym/:id' do
#     @pokemon = Pokemon.find(params[:id])
#     erb(:"pokemon/show")
# end


# end