class MakersBnb < Sinatra::Base
  post '/request/new' do
    space = Space.get(params[:space_id])
    validate(space) 
    request = Request.create(date_from: params[:date_from],
                             date_to: params[:date_to],
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
    @requests.each do |request|
      @space_names << Space.get(request.space_id).name
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
    range = (request.date_from..request.date_to)

    Request.all.each do |request|
      if request.space_id == space.id && request.status == 'Not Confirmed'
        if range.include?(request.date_from) || range.include?(request.date_to)
          request.update(status: 'Denied')
        end
      end
    end

    Booking.create(date_from: request.date_from, 
                   date_to: request.date_to, 
                   user_id:request.user_id, 
                   space_id: request.space_id)
    redirect('/requests')
  end
end
