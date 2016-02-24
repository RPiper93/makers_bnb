feature 'Making a booking' do
  scenario 'User can make a booking' do
    create_user
    create_space
    click_button 'Sign out'
    create_user(first_name: "Joe",last_name: "Schmo", email: "joe@email.com" ) 
    click_link "Sam's space"
    fill_in :start_date, with: Date.new(2016,02,23)
    fill_in :end_date, with: Date.new(2016, 02, 24)
    click_button "Request a booking"
    expect(page).to have_content('Your booking request has been sent')
  end
end
