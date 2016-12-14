require 'rails_helper'

feature "Spec" do 
  let(:user) {create(:user)}
  before(:each) do 

    visit "/"
    expect(current_path).to eq(root_path)

    click_link "New user"

    fill_in 'Name', with: "User"
    fill_in 'Age', with: 19
    click_button "Create User"
  
  end	

	scenario "user" do 
    
    expect(page).to have_content("User")

	end	

	scenario "user cart" do
  
    visit "/"
    click_link 'User'
    click_link 'Cart'
    expect(page).to have_content("User cart")

	end	

	scenario "user item" do

    visit "/"
    click_link 'User'
    click_link 'Items'
    expect(page).to have_content("All items")

    click_link "New item"
    fill_in "Name", with: "New item"
    fill_in "Price", with: 19
    click_button "Create Item"     

    expect(page).to have_content("19")

  end

  scenario "add item to cart" do 

    visit "/"
    click_link 'User'
    click_link 'Items'

    click_link "New item"
    fill_in "Name", with: "New item"
    fill_in "Price", with: 19
    click_button "Create Item"     
    click_link 'Back'
    click_link 'Add to cart'
    expect(page).to have_content("User cart")  

    click_link 'Delete'
    expect(page).to have_content("No one item find")

  end	

end	