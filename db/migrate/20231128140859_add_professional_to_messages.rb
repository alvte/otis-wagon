class AddProfessionalToMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :professional, null: false, foreign_key: true
  end
end
