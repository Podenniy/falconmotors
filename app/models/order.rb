class Order < ActiveRecord::Base
 has_many :line_items, dependent: :destroy
 belongs_to :pyment_type
 belongs_to :delivery_method
 belongs_to :user
 validates :name,  :email, presence: true
 #validates :pay_type, inclusion: 

 def add_line_items_from_cart(cart)
   cart.line_items.each do |item|
   	 item.cart_id = nil
   	 line_items <<  item
   end
 end

 def user_ord(user)
 	self.name = user.first_name
 	self.email = user.email
 	self.user_id = user.id
 end

 def total_summ
 	line_items.to_a.sum { |item| item.total_price}
 end
end
