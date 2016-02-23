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
    expect(page).to have_content("Price: £30.00")
  end

end
