class Cup < ApplicationRecord
	belongs_to :user

	self.per_page = 10

	validates :name, presence: true
	validates :price, numericality: {grater_than: 0}
end
