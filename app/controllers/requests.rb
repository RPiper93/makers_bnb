class MakersBnb < Sinatra::Base
  post '/request/new' do
    user = current_user
    request = Request.create(start_date: params[:start_date],
                             end_date: params[:end_date],
                             status: "Not Confirmed",
                             user_id: current_user.id,
                             space_id: params[:space_id])
    if request.saved?
      flash.next[:saved] = ['Your booking request has been sent']
      redirect('/spaces')
    end
  end

  get '/requests' do
    user = current_user
    @spaces = user.spaces
    erb :requests
  end

  get '/requests/confirm/:id' do
    @booking_request = Request.get(params[:id])
    @space = Space.get(@booking_request.space_id)
    erb :confirm_requests
  end

  post '/request/confirm' do
     Request.first(id: params[:id]).update(status: "Confirmed")
     redirect('/requests')
  end
end
