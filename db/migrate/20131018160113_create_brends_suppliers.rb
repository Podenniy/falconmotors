class CreateBrendsSuppliers < ActiveRecord::Migration
  def change
    create_table :brends_suppliers do |t|
      t.integer :brend_id
      t.integer :supplier_id
    end
  end
end
