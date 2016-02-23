
feature "Create a space" do

  feature 'Create multiple spaces' do
    scenario 'can create multiple spaces with names' do
      create_user
      create_space
      create_space
      expect(page).to have_content("Iryna's Space Iryna's Space")
    end
  end

end