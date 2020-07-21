class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      # t.references :company, foreign_key: true
      # t.references :user, foreign_key: true
      t.belongs_to :user
      t.belongs_to :company

      t.timestamps
    end
  end
end
