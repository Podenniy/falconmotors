class CreateDeliveryMethods < ActiveRecord::Migration
  def self.up
    create_table :delivery_methods do |t|
      t.string :name
      
      t.timestamps
    end

    DeliveryMethod.create(name: 'Cамовывоз')
    DeliveryMethod.create(name: 'Доставка курьером')
  end

  def self.down
  	drop_table :delivery_methods
  end
end
