feature 'Email notification' do
  scenario 'sent upon successful user sign-up' do
    create_user
    expect(page).to have_content('Sign-up complete! Confirmation email sent.')
  end

  scenario 'sent upon successfully listing a space' do
    create_user
    create_space
    expect(page).to have_content('Space listed! Confirmation email sent.')
  end

  scenario 'sent upon successfully updating a space' do
    create_user
    create_space
    update_space
    expect(page).to have_content('Space updated! Confirmation email sent.')
  end

  scenario 'sent upon successfully submitting a booking request' do
    create_user
    create_space
    click_button('Sign out')
    make_request
    expect(page).to have_content('Booking request submitted! Confirmation email sent.')
  end
end
