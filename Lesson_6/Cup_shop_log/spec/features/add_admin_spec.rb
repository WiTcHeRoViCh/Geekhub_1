require 'rails_helper'

feature "Admin" do
	#let(:user3) {create(:user,email: "b@b.h", id: 6)}
  let(:admin) {create(:user, email: "email@email.com", admin: true, id: 5)}
  
  scenario "create admin" do
  	expect(User.find(6).admin).to eq(true)
    visit "/"
    click_link "Sign in"
    expect(current_path).to eq "/sign_in"

    fill_in "Email",    with: "email@email.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    #binding.pry
    expect(current_path).to eq "/users/1"
    expect(admin.admin).to eq(true)
    #binding.pry
    click_link "Admin path"
    expect(current_path).to eq "/admin/users"

    click_link "All users"
    #binding.pry
    visit("/admin/users/6/edit")
    #expect(User.find(6).admin).to eq(false)
    #binding.pry
    #User.find(6).admin = true
    fill_in "Admin", with: false
    click_button "Save"
    expect(current_path).to eq(all_users_path)
    expect(User.find(6).admin).to eq(false)

  end
end  	
