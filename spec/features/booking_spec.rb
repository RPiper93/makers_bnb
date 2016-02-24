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
    click_link('Requests')
    expect(page).to have_content('Sam\'s space Not confirmed 23/02/16 - 24/02/16')
    click_link('Confirm?')
    click_button('Confirm Request')
    expect(page).to have_content('Sam\'s space Confirmed 23/02/16 - 24/02/16')
  end
end

