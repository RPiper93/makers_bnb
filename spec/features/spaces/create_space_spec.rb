feature "Create a space" do

  scenario 'can create multiple spaces with names' do
    create_user
    create_space(name: "Iryna's space")
    create_space
    expect(page).to have_content("Iryna's space")
    expect(page).to have_content("Sam's space")
  end

  scenario 'can add a description' do
    create_user
    create_space(name: "Iryna's space", description: "Some beautiful space")
    expect(page).to have_content("Some beautiful space")
  end

  scenario 'can add a price' do
    create_user
    create_space(price: 30)
    expect(page).to have_content("Price per night: £30.00")
  end

  scenario 'can add date from and to' do
    create_user
    create_space(date_from: Date.new(2016,02,23), date_to: Date.new(2016,02,24))
    click_link("Sam's space")
    expect(page.status_code).to eq(200)
    expect(page).to have_content("Available From: 23/02/16 Available To: 24/02/16")
  end

  scenario 'can upload image' do
    create_user
    create_space
    Capybara.default_selector = :css
    expect(page).to have_selector("img")
  end
end
