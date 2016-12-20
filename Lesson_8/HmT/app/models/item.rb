class Item < ApplicationRecord
	has_many :positions

  has_many :carts, through: :positions	

end
