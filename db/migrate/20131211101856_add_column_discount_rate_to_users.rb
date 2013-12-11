class AddColumnDiscountRateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :discount_rate, :float
  end
end
