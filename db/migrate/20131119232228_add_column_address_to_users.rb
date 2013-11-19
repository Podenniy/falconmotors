class AddColumnAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :string, :string
  end
end
