require 'rails_helper'

feature "Spec" do
  let(:user) {create(:user)}

  scenario "user" do 

    visit "/"
    expect(current_path).to eq(root_path)

    click_link "New user"

    fill_in 'Name', with: "Sudo"
    fill_in 'Second name', with: "Apt"
    fill_in 'Age', with: 19
    click_button "Create User"

    expect(page).to have_content("Sudo")
  
  end	

  scenario "user comment" do

    visit "/"
    click_link "Sudo"
    expect(page).to have_button("Add comments")

    fill_in "Body", with: "New comment"
    click_button "Add comments"
    expect(page).to have_content("New comment")

  end	

  scenario "user item and item comment" do

    visit "/"
    click_link "Sudo"
    expect(page).to have_content("All items")

    click_link "All items"
    click_link "New item"
    expect(page).to have_content("New item")

    fill_in 'Name', with: 'Hook'
    fill_in 'Price', with: 100
    click_button "Create Item"
    expect(page).to have_content("Hook")

    fill_in "Body", with: "New comment"
    click_button "Add comments"
    expect(page).to have_content("New comment")
  
  end	

end  