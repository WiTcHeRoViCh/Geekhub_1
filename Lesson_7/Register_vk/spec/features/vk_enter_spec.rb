require 'rails_helper'

feature 'VK' do 

  before(:each) do
      OmniAuth.config.mock_auth[:vkontakte] = OmniAuth::AuthHash.new(
        provider: 'vkontakte',
        uid: '1',
        info: { email: 'cheburator@nagibator.com', name: 'Коша Наркоша' })
  end

  scenario 'enter' do

    visit root_path
    click_link 'Vk'
    
    expect(page).to have_content('cheburator@nagibator.com')
  end      

  scenario 'logout' do
    
    visit root_path
    click_link 'Vk'

    click_link 'Logout'

    expect(page).to have_content('Vk')

  end	
end  