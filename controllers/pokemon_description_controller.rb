class PokemonGym < Sinatra::Base

require 'json'
set :method_override, true

get '/pokemon_descriptions/:name' do
	@pokemon_description = Pokemondescription.find_by pokemon_name: params[:name]
	unless @pokemon_description.nil?
  		# hooray, match
 		 @pokemon_description.to_json
	else
 		{:message => "No pokemon were found."}.to_json
	end
end

post '/pokemon_descriptions' do
		puts params.to_json
 		# @pokemon_description = params[:pokemon_description]
  		# @new_pokemon_description = Pokemondescription.create(pokemon_description) 
  		# @new_pokemon_description.to_json

  		# create a new description, and then then redirect to a template that renders that newly created description
end



	# get '/pokemonad' do
 #  		@pokemonads = Pokemonad.all.to_json 
	# end

	# get '/pokemonads/:id' do
 #   		@pokemonads = Pokemonad.find(params[:id])
 #   		erb(:"/pokemon_ad/show")
	# end

	# post '/pokemonads' do
 # 		pokemonads = params[:pokemonad]
 #  		new_pokemonad = Pokemonad.create(pokemonads) 
 #  		redirect to('/map')
	# end
end