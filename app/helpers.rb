module Helpers
  def current_user
    @user ||= User.get(session[:user])
  end

  def format_date(date)
    date.strftime("%d/%m/%y")
  end

  def format_price(price)
    "£" + sprintf("%0.02f", price)
  end

  def reset_date_filter
    session[:date_from] = nil
    session[:date_to] = nil
  end

  def send_mail
    Pony.mail({
      to: current_user.email,
      from: ENV['from'],
      subject: "Welcome #{current_user.first_name} to MakersBnB!",
      body: 'Thanks for signing up to MakersBnb!',
      via: :smtp,
      via_options: {
        address:              'smtp.gmail.com',
        port:                 '587',
        enable_starttls_auto: true,
        user_name:            ENV['user_name'],
        password:             ENV['password'],
        authentication:       :plain,
        domain:               "localhost.localdomain"
      }
    })

    flash.next[:errors] = ['Sign-up confirmation email sent']
  end

  def reject_booking_conflicts(date, range)
    date.each do |booking|
      if range.include?(booking.to_s)
        flash.next[:booked] = ['Unavailable on these dates'] 
        redirect('/space/' + params[:space_id])
      end
    end
  end

  def reject_unavailable_dates(space)
    if Date.parse(params[:date_from]) < space.date_from || Date.parse(params[:date_from]) > space.date_to
      flash.next[:booked] = ['Dates outside of range']
      redirect('/space/' + params[:space_id])
    end
  end

  def validate_space(space)
    if current_user.id == space.user_id
      redirect('/spaces')
    end
  end

  def validate(space)
    validate_space(space)
    reject_unavailable_dates(space)
    booking_from = space.bookings.map(&:date_from)
    booking_to = space.bookings.map(&:date_to)
    booked_dates = booking_from.concat(booking_to)
    request_range = (params[:date_from]..params[:date_to])
    reject_booking_conflicts(booked_dates, request_range)
  end

  def validate_space_availability(date_from, date_to, route)
    if date_from > date_to
      flash.next[:errors] = ['Invalid date range!']
      redirect(route)
    end
  end
end
