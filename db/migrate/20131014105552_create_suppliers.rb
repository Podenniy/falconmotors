class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.decimal :price, precision: 8, scale:2
      t.integer :quantity
      t.integer :delivery

      t.timestamps
    end
  end
end
