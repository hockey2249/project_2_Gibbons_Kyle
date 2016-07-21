class PokemonGym < Sinatra::Base
require 'json'

set :method_override, true

#Get all Pokemon list 

get '/pokemon-gym' do
  @pokemons = Pokemon.all.to_json 

end

#Show the different Pokemon Id's 

get '/pokemons/:id' do
    @pokemon = Pokemon.find(params[:id])
    erb(:"/pokemon_gym/show")
end

#create pokemon pin to drop on the map 

post '/pokemons' do
  pokemon = params[:pokemon]
  new_pokemon = Pokemon.create(pokemon) 
  p new_pokemon
  redirect to('/map')
end

#edit your pokemon 
get '/pokemons/:id/edit' do 
  @pokemon = Pokemon.find(params[:id])
  erb(:"/pokemon_gym/edit")

end

# #Update the pokemon database 

put '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  if @pokemon.update_attributes(params[:pokemon])
    @pokemon.save
    redirect to('/map')
  else
    erb(:"/pokemon_gym/edit") 
  end
end

# delete

delete '/pokemons/:id' do
    @pokemon = Pokemon.find(params[:id])
      old_id = @pokemon.id
        if @pokemon.destroy
         {:destroyed_pokemon => old_id }.to_json
        else
           { :message => 'pokemon not destroyed' }.to_json
    end
end
end
