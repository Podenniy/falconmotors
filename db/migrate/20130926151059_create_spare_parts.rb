class CreateSpareParts < ActiveRecord::Migration
  def change
    create_table :spare_parts do |t|
      t.string :title
      t.text :descriptions
      t.string :image_url
      t.decimal :price, precision: 8, scale:2

      t.timestamps

    end
    add_index :spare_parts, :price
    add_index :spare_parts, :title
  end
end
