ENV['RACK_ENV'] ||= 'development'

require './app/database_mapper_helper.rb'
require 'sinatra/base'
require 'sinatra/flash'
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

    def check_bookings(date, range)
      date.each do |booking|
        if range.include?(booking.to_s) 
          flash.next[:booked] = ['Unavailable on these dates'] 
          redirect('/space/' + params[:space_id])
        end
      end
    end

    def validate_dates(space)
      if Date.parse(params[:start_date]) < space.date_from || Date.parse(params[:start_date]) > space.date_to
        flash.next[:booked] = ['Dates outside of range']
        redirect('/space/' + params[:space_id])
      end
    end

    def validate(space)
      validate_dates(space)
      booking_from = space.bookings.map(&:from_date)
      booking_to = space.bookings.map(&:end_date)
      request_range=(params[:start_date]..params[:end_date])
      check_bookings(booking_from, request_range)
      check_bookings(booking_to, request_range)
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
