require 'rails_helper'

feature 'Spec' do 

  before(:each) do

    visit "/"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Fruit")
    expect(page).to have_content("Vegetable")
    
    click_link 'Fruit'
    expect(current_path).to eq(fruits_path)
    expect(page).to have_content("New fruit")
  end	

  scenario 'new fruit' do

    click_link 'New fruit'
    expect(current_path).to eq(new_fruit_path)
    
    fill_in 'Name', with: 'Name 1'
    fill_in 'Price', with: 100
    click_button 'Create Fruit'
    expect(page).to have_content("100")
    expect(page).to have_content("Back")

  end	

  scenario 'delete fruit' do

    expect(page).to have_content("Name 1")

    click_link 'Delete'
    expect(page).to_not have_content("Name 1")
  
  end	

end	