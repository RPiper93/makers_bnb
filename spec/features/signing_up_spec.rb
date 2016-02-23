feature 'Sign-up' do
  scenario 'User can sign-up' do
    create_user
    expect(page).to have_content "Welcome Sam"
  end
end
