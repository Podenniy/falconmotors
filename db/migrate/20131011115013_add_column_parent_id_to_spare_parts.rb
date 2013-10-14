class AddColumnParentIdToSpareParts < ActiveRecord::Migration
  def change
  	add_column :spare_parts, :parent_id, :integer
  end
end
