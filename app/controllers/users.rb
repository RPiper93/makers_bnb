class MakersBnb < Sinatra::Base
  delete '/' do 
    session.clear
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
      send_mail
      redirect('/spaces')
    else 
      flash.next[:errors] = user.errors.full_messages
      redirect('/')
    end
  end

  get '/user/sign_in' do 
    erb :'users/sign_in'
  end

  post '/user/sign_in' do 
    @user = User.authenticate(params[:email],params[:password])
    if @user == :nonexistent_user
      flash.next[:errors] = ["User does not exist"]
      redirect('/user/sign_in')
    elsif @user == :incorrect_password 
      flash.next[:errors] = ["Incorrect password"]
      redirect('/user/sign_in')
    else 
      session[:user] = @user.id
      redirect('/spaces')
    end
  end
end
