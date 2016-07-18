class Pokemon < Sinatra::Base

  # General route actions
  get '/' do
  	send_file File.expand_path('index.html', settings.public_folder)
  end

end
