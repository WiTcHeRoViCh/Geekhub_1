require 'rails_helper'

feature 'Spec' do 

  before(:each) do

    visit "/"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Fruit")
    expect(page).to have_content("Vegetable")
    
    click_link 'Vegetable'
    expect(current_path).to eq(vegetables_path)
    expect(page).to have_content("New vegetable")
  end	

  scenario 'new vegetable' do

    click_link 'New vegetable'
    expect(current_path).to eq(new_vegetable_path)
    
    fill_in 'Name', with: 'Name 1'
    fill_in 'Price', with: 100
    click_button 'Create Vegetable'
    expect(page).to have_content("100")
    expect(page).to have_content("Back")

  end	

  scenario 'delete vegetable' do

    expect(page).to have_content("Name 1")

    click_link 'Delete'
    expect(page).to_not have_content("Name 1")
  
  end	

end	