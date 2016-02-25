ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require './app/database_mapper_helper.rb'
require 'sinatra/base'
require 'sinatra/flash'
require 'dotenv'
Dotenv.load
require 'pony'
require_relative 'database_mapper_helper'
require_relative 'server'
require_relative 'controllers/users.rb'
require_relative 'controllers/spaces.rb'
require_relative 'controllers/requests.rb'

class MakersBnb < Sinatra::Base
  get '/' do
    erb :index
  end

  helpers do
    def current_user
      @user ||= User.get(session[:user])
    end

    def format_date(date)
    date.strftime("%d/%m/%y")
    end
    
    def reset_date_filter
      session[:date_from] = nil
      session[:date_to] = nil
    end

    def send_mail
      Pony.mail({
        to: current_user.email,
        from: ENV['from'],
        subject: "Welcome #{current_user.first_name} to MakersBnB!",
        body: 'Thanks for signing up to MakersBnb!',
        via: :smtp,
        via_options: {
              address:              'smtp.gmail.com',
              port:                 '587',
              enable_starttls_auto: true,
              user_name:            ENV['user_name'],
              password:             ENV['password'],
              authentication:       :plain,
              domain:               "localhost.localdomain"
            }
      })
      
      flash.next[:errors] = ['Sign-up confirmation email sent']
    end
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
