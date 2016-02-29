feature 'Making a booking' do
  scenario 'User can make a booking' do
    create_user
    create_space
    click_button 'Sign out'
    make_request
    expect(page).to have_content('Your booking request has been sent')
  end
end

feature 'Confirming a booking' do
  scenario 'User can confirm a booking request' do
    create_user
    create_space
    click_button 'Sign out'
    make_request
    click_button 'Sign out'
    sign_in
    click_button 'Requests'
    expect(page).to have_content('Sam\'s space Not Confirmed 23/02/16 - 24/02/16')
    click_link('Confirm?')
    click_button('Confirm Request')
    expect(page).to have_content('Sam\'s space Confirmed 23/02/16 - 24/02/16')
  end

  scenario 'booked dates change to unavailable' do
    create_user
    create_space(date_to: Date.new(2016,04,29))
    click_button 'Sign out'
    make_request
    click_button 'Sign out'
    sign_in
    click_button 'Requests'
    click_link('Confirm?')
    click_button('Confirm Request')
    click_button 'Sign out'
    create_user(email: "not_sam@email.com")
    click_link("Sam's space")
    expect(page).to have_content('Unavailable from 23/02/16')
    fill_in :date_from, with: Date.new(2016,02,23)
    fill_in :date_to, with: Date.new(2016,03,28)
    click_button('Request a booking')
    expect(page).to have_content('Unavailable on these dates')
  end

end



