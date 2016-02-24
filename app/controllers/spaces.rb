class MakersBnb < Sinatra::Base
  get '/spaces' do
    @spaces = Space.all
    @user = User.get(session[:user])
    erb :spaces
  end

  post '/spaces' do
    attributes = {
      name: params[:name],
      description: params[:description],
      price: params[:price],
      date_from: params[:date_from],
      date_to: params[:date_to],
      user_id: current_user.id
    }

    if session[:space_id]
      Space.first(id: session[:space_id]).update(attributes)
    else
      Space.create(attributes)
    end
    
    redirect('/spaces')
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  get '/spaces/update' do
    @space = Space.get(session[:space_id])
    erb :spaces_new
  end

  post '/spaces/update' do
    session[:space_id] = params[:space_id]
    redirect('/spaces/update')
  end  

  get '/space/:id' do
    @space = Space.get(params[:id])
    erb :view_space
  end
end
