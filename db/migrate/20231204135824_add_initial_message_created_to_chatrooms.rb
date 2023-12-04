class AddInitialMessageCreatedToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :initial_message_created, :boolean
  end
end
