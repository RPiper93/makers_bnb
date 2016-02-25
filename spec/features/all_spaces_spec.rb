feature "All spaces" do
  scenario "can be filtered by date" do
    create_user
    create_space
    create_space(name: "Tom's space",
                 description: "Nice Space",
                 price: 40,
                 date_from: Date.new(2016,02,23),
                 date_to: Date.new(2016,02,28),
                 user_id: 1)
    create_space(name: "New nice space",
                 description: "some different Space",
                 price: 40,
                 date_from: Date.new(2016,02,18),
                 date_to: Date.new(2016,02,24),
                 user_id: 1)
    fill_in(:date_from, with: Date.new(2016,02,19))
    fill_in(:date_to, with: Date.new(2016,02,23))
    click_button('Filter Spaces')
    expect(page).to have_content('New nice space')
    expect(page).not_to have_content("Tom's space")
  end
end
