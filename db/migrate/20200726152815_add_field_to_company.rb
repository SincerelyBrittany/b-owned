class AddFieldToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :phone, :integer
    add_column :companies, :email, :string
    add_column :companies, :website, :string
    add_column :companies, :location, :string
    add_column :companies, :user_id, :integer
  end
end
