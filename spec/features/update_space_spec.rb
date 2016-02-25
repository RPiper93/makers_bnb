feature 'Update a space' do
  scenario 'updates the details of the logged-in user\'s space' do
    create_user
    create_space
    click_button('Update Space')
    fill_in(:name, with: "Sam's NEW space")
    click_button('Update Space')
    expect(page).not_to have_content("Sam's space")
    expect(page).to have_content("Sam's NEW space")
  end

  scenario 'no Update Space button for other users\' spaces' do
    create_user
    create_space
    click_button('Sign out')
    create_user(first_name: "Alain",
                last_name: "Lemaire",
                email: "alain@lemaire.com",
                password: "123",
                password_confirmation: "123")
    expect(page).not_to have_content('Update Space')
  end
end
