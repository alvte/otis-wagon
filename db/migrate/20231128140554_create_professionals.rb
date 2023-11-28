class CreateProfessionals < ActiveRecord::Migration[7.1]
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :specialization
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
