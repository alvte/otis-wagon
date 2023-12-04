class AddFromToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :from_card, :string
    add_column :chatrooms, :from_marketplace, :string
    add_column :chatrooms, :from_card_marketplace, :string
  end
end
