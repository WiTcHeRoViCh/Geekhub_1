class Plane < ActiveRecord::Base

   validates :name, :price, presence: true
   validates :price, numericality: {only_integer: true, greater_than: 0}

end
