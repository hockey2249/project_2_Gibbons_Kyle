class Pokemon < Sinatra::Base

  get '/pokemon_gym' do
  	 get '/pokemon_gym' do
     @pokemon_gyms = Pokemon_gym.all
   	 erb(:"/home")
  end

  end

end
