class AddColumnLegalEntityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :legal_entity, :boolean, :default => false
  end
end
