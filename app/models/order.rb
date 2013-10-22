class Order < ActiveRecord::Base
 has_many :line_items, dependent: :destroy
 belongs_to :pyment_type
 belongs_to :delivery_method
 validates :name, :address, :email, presence: true
 #validates :pay_type, inclusion: 

 def add_line_items_from_cart(cart)
   cart.line_items.each do |item|
   	 item.cart_id = nil
   	 line_items <<  item
   end
 end
end
