class User < ApplicationRecord
	has_many :items
	has_many :comments, as: :commentable, dependent: :destroy
end
