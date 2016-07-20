class PokemonGym < Sinatra::Base

  # General route actions
  get '/index' do
    erb :index
  end

  get '/home' do
    erb :home
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

  # RESTful Retrieve Pokemon List Controller Actions
  # inde

end
