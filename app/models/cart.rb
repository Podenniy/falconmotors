class Cart < ActiveRecord::Base
  
  has_many :line_items, dependent: :destroy




  def total_price
    line_items.to_a.sum { |item| item.total_price}
  end 

  def add_spare_part(spare_part_id)
  	current_item = line_items.find_by_spare_part_id(spare_part_id)
    if current_item
  	  current_item.quantity +=1
    else
  	  current_item = line_items.build(spare_part_id: spare_part_id)
      current_item.price = current_item.spare_part.price
   end
     current_item
  end
  def not_add_line_item
    current_item = line_items.find_by_spare_part_id(spare_part_id)
  end
end
