feature '' do
  scenario '' do
    create_user
    create_space
    click_link("Sam's space")
    click_link('Update Space')
    fill_in(:name, with: "Sam's NEW space")
    click_button('Update Space')
    expect(page).not_to have_content("Sam's space")
    expect(page).to have_content("Sam's NEW space")
  end
end