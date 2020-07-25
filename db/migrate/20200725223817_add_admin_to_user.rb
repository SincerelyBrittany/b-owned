class AddAdminToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :owner, :boolean
  end
end
