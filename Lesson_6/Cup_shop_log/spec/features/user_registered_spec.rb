require 'rails_helper'

feature "User registers" do

  scenario "with valid details" do
    
    visit "/"

    click_link "Sign up"
    expect(current_path).to eq(sign_up_path)

    fill_in "Name",                  with: "Name"
    fill_in "Email",                 with: "o@o.o"
    fill_in "Password",              with: "123"
    fill_in "Password confirmation", with: "123" 
    click_button "Sign up"

    expect(current_path).to eq "/users/7"

    click_link "Sign out"
    expect(current_path).to eq "/"

    fill_in "Email",    with: "o@o.o"
    fill_in "Password", with: "123"
    click_button "Sign in"

    expect(current_path).to eq "/users/7"
    #binding.pry
  end
  
end  	