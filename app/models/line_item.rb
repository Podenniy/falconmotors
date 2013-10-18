class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :spare_part
  belongs_to :cart
  belongs_to :price_part
  #validates :quantity, numericality: {:greater_than_or_equal_to => 1, on: :update}
  before_save :quantity_not_valid  
 
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

  def total_price
    price * quantity
  end


  private
    def quantity_not_valid  
      if quantity == nil || quantity < 1
         errors.add(:base, "Вводимое колличество олж")
        return self.quantity = 1
      end
    end

    
end
