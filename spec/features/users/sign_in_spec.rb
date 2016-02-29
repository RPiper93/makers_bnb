feature 'user sign in' do
  scenario 'logs in user' do
    User.create(first_name: "Sam", last_name: "Morgan", 
                email: "sam@email.com", password: "Abc123", password_confirmation: "Abc123")
    visit '/user/sign_in'
    fill_in :email, with: "sam@email.com"
    fill_in(:password, with: "Abc123")
    within('div.account-form') do
      click_button "Sign in"
    end
    expect(current_path).to eq '/spaces'
    expect(page).to have_content "Welcome Sam"
  end

end
