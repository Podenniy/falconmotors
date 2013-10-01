class AddCategoryIdToSpareParts < ActiveRecord::Migration
  def change
  	add_column :spare_parts, :category_id, :integer
  end
end
