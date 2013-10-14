class AddImageToBrends < ActiveRecord::Migration
  def change
  	 add_column :brends, :image, :string
  end
end
