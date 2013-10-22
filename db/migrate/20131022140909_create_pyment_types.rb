class CreatePymentTypes < ActiveRecord::Migration
  def self.up
    create_table :pyment_types do |t|
      t.string :name
      t.timestamps
    end

    PymentType.create(name: 'Наличный')
    PymentType.create(name: 'Безналичный')
  end
  
  def self.down
  	drop_table :payment_types
  end
end
