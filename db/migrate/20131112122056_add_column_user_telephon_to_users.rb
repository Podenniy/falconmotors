class AddColumnUserTelephonToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_telephon, :integer
  end
end
