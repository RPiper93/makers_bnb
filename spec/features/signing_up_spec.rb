feature 'Sign-up' do
  scenario 'User can sign-up' do
    visit('/')
    fill_in :first_name, with: "Sam"
    fill_in :last_name, with: "Morgan"
    fill_in :email, with: "sam@email.com"
    fill_in :password, with: "123abc"
    fill_in :password_confirmation, with: "123abc"
    click_button "Sign-up"
    expect(page).to have_content "Welcome Sam"
  end
end
