require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) {create(:user, admin: true, id: 2)}

  it "name should be presence" do    
    expect(user1.name).to eq("name")
  end

end	