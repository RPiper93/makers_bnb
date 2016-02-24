class MakersBnb < Sinatra::Base
  get '/spaces' do
    @spaces = Space.all
    @user = User.get(session[:user])
    erb :spaces
  end

  post '/spaces' do
    Space.create(
                name: params[:name],
                description: params[:description],
                price: params[:price],
                date_from: params[:date_from],
                date_to: params[:date_to]
    )
    redirect('/spaces')
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  get '/space/:id' do
    @space = Space.get(params[:id])
    erb :view_space
  end
end
