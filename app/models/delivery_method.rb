class DeliveryMethod < ActiveRecord::Base
  has_many :orders
end
