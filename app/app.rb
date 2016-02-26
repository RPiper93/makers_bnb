ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require './app/database_mapper_helper.rb'
require 'sinatra/base'
require 'sinatra/flash'
require 'dotenv'
Dotenv.load
require 'pony'
require_relative 'helpers.rb'
require_relative 'database_mapper_helper'
require_relative 'server'
require_relative 'controllers/users.rb'
require_relative 'controllers/spaces.rb'
require_relative 'controllers/requests.rb'

class MakersBnb < Sinatra::Base
  include Helpers
  
  get '/' do
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
