class AddColumnSparePartIdToPriceParts < ActiveRecord::Migration
  def change
    add_column :price_parts, :spare_part_id, :integer
  end
end
