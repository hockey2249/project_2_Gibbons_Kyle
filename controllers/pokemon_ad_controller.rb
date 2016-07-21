class PokemonGym < Sinatra::Base

require 'json'

get '/pokemon-ad' do
  @pokemonads = Pokemonad.all.to_json 
	end

get '/pokemonads/:id' do
    @pokemonads = Pokemonad.find(params[:id])
    erb(:"/pokemon_ad/show")
end

post '/pokemonads' do
  pokemonads = params[:pokemonad]
  new_pokemonad = Pokemonad.create(pokemonads) 
  p new_pokemonad
  redirect to('/map')
end

end