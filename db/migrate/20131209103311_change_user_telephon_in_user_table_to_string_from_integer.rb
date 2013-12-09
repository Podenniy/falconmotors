class ChangeUserTelephonInUserTableToStringFromInteger < ActiveRecord::Migration
  def change
  	remove_column :users, :user_telephon, :integer
  	add_column :users, :user_telephon, :string
  end
end
