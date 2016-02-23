ENV['RACK_ENV'] ||= 'development'

require './app/database_mapper_helper.rb'
require 'sinatra/base'
require_relative 'database_mapper_helper'

class MakersBnb < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/user/new' do
    user = User.create(first_name: params[:first_name],
                last_name: params[:last_name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user] = user.id
    redirect('/spaces')
  end

  get '/spaces' do
    @spaces = Space.all
    @user = User.get(session[:user])
    erb :spaces
  end

  post '/spaces' do
    Space.create(name: params[:name])
    redirect('/spaces')
  end

  get '/spaces/new' do
    erb :spaces_new
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end