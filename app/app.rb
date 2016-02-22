ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class MakersBnb < Sinatra::Base
  get '/spaces' do
    erb :spaces
  end

  get '/spaces/new' do
    erb :spaces_new
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
