class CreateBrends < ActiveRecord::Migration
  def change
    create_table :brends do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :brends, :title
  end
end
