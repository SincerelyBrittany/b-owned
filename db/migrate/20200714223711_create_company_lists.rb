class CreateCompanyLists < ActiveRecord::Migration[6.0]
  def change
    create_table :company_lists do |t|
      t.belongs_to :list
      t.belongs_to :company
      t.timestamps
    end
  end
end
