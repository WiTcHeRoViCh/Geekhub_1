class User < ApplicationRecord
  after_create :create_cart

  has_one :cart

end
