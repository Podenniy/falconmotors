class AddColumnPricePartIdToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :price_part_id, :integer
  end
end
