feature 'A user can sign out' do
  scenario 'user logs out' do
    sign_in
    expect(page).to have_content("Welcome Sam")
    click_button("Sign out")
    expect(page).not_to have_content("Sam")
    expect(page).to have_content("Welcome")
  end
end
