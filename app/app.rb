ENV['RACK_ENV'] ||= 'development'

require './app/database_mapper_helper.rb'
require 'sinatra/base'

class MakersBnb < Sinatra::Base
  get '/' do
    erb :index
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
