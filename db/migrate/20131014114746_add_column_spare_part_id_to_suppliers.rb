class AddColumnSparePartIdToSuppliers < ActiveRecord::Migration
  def change
  	 add_column :suppliers, :spare_part_id, :integer
  end
end
