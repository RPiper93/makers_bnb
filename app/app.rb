ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'database_mapper_helper'

class MakersBnb < Sinatra::Base
  enable :sessions

  get '/spaces' do
    @space = session[:space]
    erb :spaces
  end

  post '/spaces' do
    session[:space] = Space.new
    redirect('/spaces')
  end

  get '/spaces/new' do
    erb :spaces_new
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
