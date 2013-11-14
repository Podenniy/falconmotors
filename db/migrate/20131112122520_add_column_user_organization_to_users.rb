class AddColumnUserOrganizationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_organization, :string
  end
end
