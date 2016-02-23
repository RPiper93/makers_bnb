ENV['RACK_ENV'] ||= 'development'

require './app/database_mapper_helper.rb'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'database_mapper_helper'

class MakersBnb < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  delete '/' do 
    session[:user] = nil
    redirect ('/')
  end 

  post '/user/new' do
    user = User.create(first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
    if user.saved? 
      session[:user] = user.id
      redirect('/spaces')
    else 
      flash.next[:errors] = user.errors.full_messages
      redirect('/')
    end
  end

  get '/user/sign_in' do 
    erb :sign_in
  end

  post '/user/sign_in' do 
    user = User.authenticate(params[:email],params[:password])
    if user == :nonexistent_user
      flash.next[:errors] = ["User does not exist"]
      redirect('/user/sign_in')
    elsif user == :incorrect_password 
      flash.next[:errors] = ["Incorrect password"]
      redirect('/user/sign_in')
    else 
      session[:user] = user.id
      redirect('/spaces')
    end
  end
  
  get '/spaces' do
    @spaces = Space.all
    @user = User.get(session[:user])
    erb :spaces
  end

  post '/spaces' do
    Space.create(
      name: params[:name],
      description: params[:description],
      price: params[:price])
    redirect('/spaces')
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  helpers do 
    def current_user
      User.get(session[:user])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
