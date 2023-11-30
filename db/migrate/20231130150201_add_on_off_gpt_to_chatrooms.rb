class AddOnOffGptToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :on_off_gpt, :boolean, default: true
  end
end
