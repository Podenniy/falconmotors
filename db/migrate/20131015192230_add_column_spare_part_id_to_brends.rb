class AddColumnSparePartIdToBrends < ActiveRecord::Migration
  def change
    add_column :brends, :spare_part_id, :integer
  end
end
