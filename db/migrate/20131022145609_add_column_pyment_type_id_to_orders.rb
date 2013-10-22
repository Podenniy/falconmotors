class AddColumnPymentTypeIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pyment_type_id, :integer
  end
end
