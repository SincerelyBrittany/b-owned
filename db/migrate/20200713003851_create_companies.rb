class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :title
      t.text :description
      t.belongs_to :owner

      t.timestamps
    end
  end
end
