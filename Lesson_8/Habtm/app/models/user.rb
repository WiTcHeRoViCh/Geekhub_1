# frozen_string_literal: true
class User < ApplicationRecord
  after_create :create_cart

  has_one :cart

  has_many :items
end
