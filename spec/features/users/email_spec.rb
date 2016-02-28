feature 'Email notification' do
  scenario 'sent upon successful user sign-up' do
    create_user
    expect(page).to have_content('Sign-up confirmation email sent')    
  end
end
