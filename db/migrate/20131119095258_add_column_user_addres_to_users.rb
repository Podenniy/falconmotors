class AddColumnUserAddresToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_addres, :string
  end
end
