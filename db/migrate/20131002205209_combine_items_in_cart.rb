class CombineItemsInCart < ActiveRecord::Migration
  def up
  	#замена нескольких записей для одного и тогоже 
  	  #  товара в корзине одной записью
  	Cart.all.each do |cart|
      #подсчет колличества каждогго товара
       sums = cart.line_items.group(:spare_part_id).sum(:quantity)

       sums.each do |spare_part_id, quantity|
       	 if quantity > 1
       	   #удаление отдельных записей 
       	   cart.line_items.where(spare_part_id: spare_part_id).delete_all
       	   cart.line_items.create(spare_part_id: spare_part_id, quantity: quantity)
       	 end
       end
    end
  end

  def down
  	#разбиение записей с quantity>1 на несколкозаписей
  	LineItem.where("quantity>1").each do |line_item|
  	  line_item.quantity.times do
  	  	LineItem.create cart_id: line_item.cart_id,
  	  	  spare_part_id: line_item.spare_part_id, quantity:1
  	  end
  	  #удаление исходной записи
  	  line_item.destroy
  	end
  	
  end
end