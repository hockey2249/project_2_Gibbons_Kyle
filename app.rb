class PokemonGym < Sinatra::Base
set :method_override, true
require 'json'

get '/index' do
  erb :index
end

get '/map' do
  @pokemons = Pokemon.all
  erb :map
end

get '/pokemon-list' do
  erb :pokemon_list
end

get '/news' do
  erb :news
end

get '/about' do
  erb :about
end

#Get all Pokemon list 

get '/pokemon-gym' do
  @pokemons = Pokemon.all.to_json 

end

#Show the different Pokemon Id's 

get '/pokemons/:id' do
    @pokemon = Pokemon.find(params[:id])
    erb(:"/show")
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
  erb(:"/edit")

end

# #Update the pokemon database 

put '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  if @pokemon.update_attributes(params[:pokemon])
    @pokemon.save
    redirect to('/map')
  else
    erb(:"/edit") 
  end
end

# delete

delete '/pokemons/:id' do
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.destroy
      redirect('/map')
    else
      redirect("/map")
    end
  end

end