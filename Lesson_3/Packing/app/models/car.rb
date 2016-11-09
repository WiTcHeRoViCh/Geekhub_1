class Car < ActiveRecord::Base

    validates :name, :weight, :presence => { :message => " cannot be blank" }

end
