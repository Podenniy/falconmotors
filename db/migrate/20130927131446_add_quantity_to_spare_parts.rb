class AddQuantityToSpareParts < ActiveRecord::Migration
  def change
  	add_column :spare_parts, :quantity, :integer, default: 0
  end
end
