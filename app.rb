class Pokemon < Sinatra::Base

  # General route actions
  get '/' do
  	erb :home
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
  # index

end
