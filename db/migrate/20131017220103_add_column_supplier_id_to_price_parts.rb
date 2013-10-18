class AddColumnSupplierIdToPriceParts < ActiveRecord::Migration
  def change
    add_column :price_parts, :supplier_id, :integer
  end
end
