class MakersBnb < Sinatra::Base
  post '/request/new' do
    user = current_user
    space = Space.get(params[:space_id])
    request = Request.create(start_date: params[:start_date],
                             end_date: params[:end_date],
                             status: "Not Confirmed",
                             user_id: current_user.id)
    space.requests << request
    space.save
    if request.saved?
      flash.next[:saved] = ['Your booking request has been sent']
      redirect('/spaces')
    end
  end

  get '/requests' do
    user = current_user
    spaces = user.spaces
    @requests = spaces.requests
    erb :requests
  end

  get '/requests/confirm/:id' do
    p current_user
    @request = Request.get(params[:id])
    p @request.user_id
    erb :confirm_requests
  end
end
