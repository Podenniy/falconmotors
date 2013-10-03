class LineItem < ActiveRecord::Base
  belongs_to :spare_part
  belongs_to :cart




  def line_quantity
     "1".to_i
  end

   def line_quantity=(add)
     
     if add[1] == '-'
       self.quantity = quantity - add.to_i 
     else
       self.quantity = add.to_i + quantity
     end

   end
end
