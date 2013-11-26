class CreateVinCods < ActiveRecord::Migration
  def change
    create_table :vin_cods do |t|
      t.string :brend_avto
      t.string :model
      t.string :year
      t.string :volume
      t.string :code
      t.text :parts_list

      t.timestamps
    end
  end
end
