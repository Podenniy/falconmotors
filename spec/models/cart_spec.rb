require 'spec_helper'

describe Cart do
  it "calculate the total_price of the Cart" 
  do
    price1 = PricePart.new(price: 20)
    price2 = PricePart.new(price: 30)
    
   line1 = LineItems.new(price_part_id:price1.id)
   line12 = LineItems.new(price_part_id:price2.id)

   
  end
end
