
feature "Create a space" do
  scenario "Can create a space" do
    visit('/spaces')
    expect(page.status_code).to eq 200
    expect(page).to_not have_content('1')
    click_button('List a Space')
    expect(current_path).to eq "/spaces/new"
    expect(page).to have_content("List a Space")
    click_button('List a Space')
    expect(current_path).to eq '/spaces'
    expect(page).to have_content('1')
  end

feature 'Create multiple spaces' do
  scenario 'can create multiple spaces' do
    create_space
    create_space
    expect(page).to have_content('1 2')
  end
end



end