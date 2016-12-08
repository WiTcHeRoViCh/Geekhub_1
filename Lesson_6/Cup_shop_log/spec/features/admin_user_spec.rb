require 'rails_helper'

feature "Admin check" do

  let(:admin) {create(:user, admin: true, id: 1)}
  
	scenario "on valid" do
    visit "/"


    click_link "Sign in"
    expect(current_path).to eq "/sign_in"

    fill_in "Email",    with: "email@email.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    #binding.pry
    expect(current_path).to eq "/users/1"
    #binding.pry
    click_link "Admin path"
    expect(current_path).to eq "/admin/users"
  end

end