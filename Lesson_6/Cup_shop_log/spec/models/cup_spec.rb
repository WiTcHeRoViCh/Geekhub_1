require 'rails_helper'

RSpec.describe Cup, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it "should have user" do
    user = FactoryGirl.create(:user, id: 3)
    cup  = FactoryGirl.create(:cup, user_id: 3)

    user.cups << cup
    user.cups.each do |cup|
      expect(cup.name).to  eq("cup")
    end	
  end
end
