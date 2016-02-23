def create_space
  visit('/spaces')
  click_button('List a Space')
  fill_in(:name, with: "Iryna's Space")
  click_button('List a Space')
end

def create_user
  visit('/')
  fill_in :first_name, with: "Sam"
  fill_in :last_name, with: "Morgan"
  fill_in :email, with: "sam@email.com"
  fill_in :password, with: "123abc"
  fill_in :password_confirmation, with: "123abc"
  click_button "Sign-up"
end