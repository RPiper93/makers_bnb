class MakersBnb < Sinatra::Base
  post '/request/new' do
    space = Space.get(params[:space_id])
    validate(space) 
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
    @spaces = Space.all(user_id: current_user.id) 
    @requests = @spaces.requests
    @space_names =  []
    @requests.each do |r|
      @space_names << Space.get(r.space_id).name
    end
    erb :'requests/requests'
  end

  get '/requests/confirm/:id' do
    @booking_request = Request.get(params[:id])
    @space = Space.get(@booking_request.space_id)
    erb :'requests/confirm_requests'
  end

  post '/request/confirm' do
    Request.first(id: params[:id]).update(status: "Confirmed") 

    request = Request.get(params[:id])
    space = Space.get(request.space_id)
    range = (request.start_date..request.end_date)

    Request.all.each do |request|
      if request.space_id == space.id && request.status == 'Not Confirmed'
        if range.include?(request.start_date) || range.include?(request.end_date)
          request.update(status: 'Denied')
        end
      end
    end

    Booking.create(from_date: request.start_date, 
                   end_date: request.end_date, 
                   user_id:request.user_id, 
                   space_id: request.space_id)
    redirect('/requests')
  end
end
