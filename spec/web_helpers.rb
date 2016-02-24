def create_space(name: "Sam's space",
                 description: "Description of Space",
                 price: 40,
                 date_from: Date.new(2016,02,23),
                 date_to: Date.new(2016,02,24),
                 user_id: 1)
  visit('/spaces')
  click_button('List a Space')
  fill_in(:name, with: name)
  fill_in(:description, with: description)
  fill_in(:price, with: price)
  fill_in(:date_from, with: date_from)
  fill_in(:date_to, with: date_to)
  click_button('List a Space')
end

def create_user(first_name: "Sam",
                last_name: "Morgan",
                email: "sam@email.com",
                password: "123abc",
                password_confirmation: "123abc")
  visit('/')
  fill_in :first_name, with: first_name
  fill_in :last_name, with: last_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "Sign-up"
end

def sign_in
  User.create(first_name: "Sam", last_name: "Morgan",
  email: "sam@email.com", password: "Abc123", password_confirmation: "Abc123")
  visit '/user/sign_in'
  fill_in :email, with: "sam@email.com"
  fill_in(:password, with: "Abc123")
  click_button "Submit"
end

def make_request
    create_user(first_name: "Joe",last_name: "Schmo", email: "joe@email.com" )
    click_link "Sam's space"
    fill_in :start_date, with: Date.new(2016,02,23)
    fill_in :end_date, with: Date.new(2016, 02, 24)
    click_button "Request a booking"
end