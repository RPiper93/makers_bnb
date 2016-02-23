
feature "Create a space" do

  scenario 'can create multiple spaces with names' do
    create_user
    create_space("Iryna's space")
    create_space ("Sam's space")
    expect(page).to have_content("Iryna's space")
    expect(page).to have_content("Sam's space")
  end

  scenario 'can add a description' do
    create_user
    create_space("Iryna's space", "Some beautiful space")
    expect(page).to have_content("Some beautiful space")
  end

end