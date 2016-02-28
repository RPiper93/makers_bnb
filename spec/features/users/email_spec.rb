feature 'Email notification' do
  scenario 'sent upon successful user sign-up' do
    create_user
    expect(page).to have_content('Sign-up confirmation email sent!')
  end

  scenario 'sent upon successfully listing a space' do
    create_user
    create_space
    expect(page).to have_content('Space listing confirmation email sent!')
  end

  scenario 'sent upon successfully updating a space' do
    create_user
    create_space
    update_space
    expect(page).to have_content('Space update confirmation email sent!')
  end
end
