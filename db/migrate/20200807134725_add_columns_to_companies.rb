class AddColumnsToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :category_id, :integer
  end
end
