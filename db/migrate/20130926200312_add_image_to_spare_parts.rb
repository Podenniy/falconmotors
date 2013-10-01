class AddImageToSpareParts < ActiveRecord::Migration
  def change
    add_column :spare_parts, :image, :string
  end
end
