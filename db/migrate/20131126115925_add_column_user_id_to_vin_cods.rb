class AddColumnUserIdToVinCods < ActiveRecord::Migration
  def change
    add_column :vin_cods, :user_id, :integer
  end
end
