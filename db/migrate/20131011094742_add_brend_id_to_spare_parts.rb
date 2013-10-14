class AddBrendIdToSpareParts < ActiveRecord::Migration
  def change
  	 add_column :spare_parts, :brend_id, :integer
  end
end
