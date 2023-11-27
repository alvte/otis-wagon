class CreateCardCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :card_categories do |t|
      t.string :name
      t.references :card, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
