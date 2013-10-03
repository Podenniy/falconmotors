class Cart < ActiveRecord::Base
  
  has_many :line_items, dependent: :destroy

  def add_spare_part(spare_part_id)
  	current_item = line_items.find_by_spare_part_id(spare_part_id)
    if current_item
  	  current_item.quantity +=1
    else
  	  current_item = line_items.build(spare_part_id: spare_part_id)
   end
     current_item
  end

end
