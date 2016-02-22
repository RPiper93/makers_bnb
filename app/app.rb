ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class MakersBnb < Sinatra::Base

  # start the server if ruby file executed directly
  run! if app_file == $0
end
