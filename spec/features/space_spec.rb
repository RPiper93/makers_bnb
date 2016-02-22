feature "Create a space" do
  scenario "Can create a space" do
    visit('/spaces')
    expect(page.status_code).to eq 200
    expect(page).to_not have_content('Listing')
    click_button('List a Space')
    expect(current_path).to eq "/spaces/new"
    expect(page).to have_content("List a Space")
    click_button('List a Space')
    expect(current_path).to eq '/spaces'
    expect(page).to have_content('Listing')
  end
end