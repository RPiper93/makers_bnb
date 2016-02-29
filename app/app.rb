ENV['RACK_ENV'] ||= 'development'
require 'rubygems'
require 'dotenv'
Dotenv.load
ENV['CLOUDINARY_URL']= ENV['cloudinary_url']
require './app/database_mapper_helper.rb'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'cloudinary'
require 'cloudinary/uploader'
require 'cloudinary/utils'
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
    if current_user
      redirect '/spaces'
    end
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
