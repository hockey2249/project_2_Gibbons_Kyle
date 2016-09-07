class PokemonGym < Sinatra::Base

require 'json'
set :method_override, true

	get '/pokemonad' do
  		@pokemonads = Pokemonad.all.to_json 
	end

	get '/pokemonads/:id' do
   		@pokemonads = Pokemonad.find(params[:id])
   		erb(:"/pokemon_ad/show")
	end

	post '/pokemonads' do
 		pokemonads = params[:pokemonad]
  		new_pokemonad = Pokemonad.create(pokemonads) 
  		redirect to('/map')
	end
end