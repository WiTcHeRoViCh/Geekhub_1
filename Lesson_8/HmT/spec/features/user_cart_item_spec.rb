require 'rails_helper'

feature 'Spec' do
  let(:user) { create(:user) }
  before(:each) do 

    visit "/"

    click_link "New user"
    expect(current_path).to eq(new_user_path)

    fill_in "Name", with: "Udov"
    fill_in "Age", with: 19
    click_button 'Create User'
    expect(page).to have_content("Items")

  end	

  scenario 'create item' do 

    click_link 'Items'
    expect(page).to have_content("All items")

    click_link "New item"
    fill_in "Name", with: "Hook"
    fill_in "Price", with: 1200
    click_button "Create Item"
    expect(page).to have_content("Add to cart")
    expect(page).to have_content("Hook")  

   
  end	

  scenario 'add item to cart' do
    visit '/'
    click_link 'Udov'
    
    click_link 'Items'
    expect(page).to have_content("Hook")

    click_link "Hook"
    expect(page).to have_content("Add to cart")

    click_link "Add to cart"
    expect(page).to have_content("Quantity")

    fill_in "Quantity", with: 3
    click_button "Add to cart"
    expect(page).to have_content("Udov cart")
    expect(page).to have_content("Hook")
    

  end

	
end