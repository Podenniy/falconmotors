class CreatePriceParts < ActiveRecord::Migration
  def change
    create_table :price_parts do |t|
      t.decimal :price, precision: 8, scale:2
      t.integer :delivery
      t.integer :quantity

      t.timestamps
    end
  end
end
