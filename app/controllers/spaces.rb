class MakersBnb < Sinatra::Base
  get '/spaces' do
    @date_from = session[:date_from]
    @date_to = session[:date_to]

    if @date_from && @date_to
      @spaces = Space.all(:date_from.lte => @date_from,
                          :date_to.gte => @date_to)
    else
      reset_date_filter
      @spaces = Space.all
    end
    @user = User.get(session[:user])
    erb :'spaces/spaces'
  end

  post '/spaces/new' do
    validate_space_availability(params[:date_from], params[:date_to], '/spaces/new')

    attributes = {
      name: params[:name],
      description: params[:description],
      price: params[:price],
      date_from: params[:date_from],
      date_to: params[:date_to],
      user_id: current_user.id
    }
    
    Space.create(attributes)
    redirect('/spaces')
  end

  post '/spaces/update/:id' do
    validate_space_availability(params[:date_from], params[:date_to], '/spaces/update/' + params[:id])

    attributes = {
      name: params[:name],
      description: params[:description],
      price: params[:price],
      date_from: params[:date_from],
      date_to: params[:date_to],
      user_id: current_user.id
    }

    Space.first(id: params[:id]).update(attributes)
    redirect('/spaces')
  end

  post '/spaces/filter' do
    validate_space_availability(params[:date_from], params[:date_to], '/spaces')
    session[:date_from] = params[:date_from]
    session[:date_to] = params[:date_to]
    redirect('/spaces')
  end

  delete '/spaces/filter-reset' do
    reset_date_filter
    redirect ('/spaces')
  end

  get '/spaces/new' do
    if !current_user
      flash.next[:errors] = ['Please log in or sign up to create new space']
      redirect('/spaces')
    end
    erb :'spaces/spaces_new'
  end

  get '/spaces/update/:id' do
    @space = Space.get(params[:id])
    erb :'spaces/spaces_new'
  end

  get '/space/:id' do
    @space = Space.get(params[:id])
    @bookings = @space.bookings
    erb :'spaces/view_space'
  end
end
