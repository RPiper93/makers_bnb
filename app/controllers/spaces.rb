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
    session[:space_id] = nil
    redirect('/spaces')
  end

  post '/spaces/filter' do
    if params[:date_from] > params[:date_to]
      flash.next[:errors] = ['Invalid date range!']
    else
      session[:date_from] = params[:date_from]
      session[:date_to] = params[:date_to]
    end

    redirect('/spaces')
  end

  delete '/spaces/filter-reset' do
    reset_date_filter
    redirect ('/spaces')
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
    @bookings = @space.bookings.map(&:from_date)
    erb :view_space
  end
end
