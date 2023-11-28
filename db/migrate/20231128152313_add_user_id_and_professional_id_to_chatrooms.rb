class AddUserIdAndProfessionalIdToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_reference :chatrooms, :user, null: false, foreign_key: true
    add_reference :chatrooms, :professional, null: false, foreign_key: true
  end
end
