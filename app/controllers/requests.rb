class MakersBnb < Sinatra::Base

	post '/request/new' do 
		user = current_user
		space = Space.get(params[:space_id])
		request = Request.create(start_date: params[:start_date], 
			end_date: params[:end_date])
		user.requests << request
		user.save
		space.requests << request
		space.save
		if request.saved?
			flash.next[:saved] = ['Your booking request has been sent']
			redirect('/spaces')
		end
	end

end