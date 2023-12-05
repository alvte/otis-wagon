# app/models/chatroom.rb
class Chatroom < ApplicationRecord

  belongs_to :user
  belongs_to :professional, optional: true
  has_many :messages

  def topic
    self.name.split("-").reject { |item| item.match?(/\d/) }.join(" ")
  end
end
