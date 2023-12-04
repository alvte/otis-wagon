# app/models/chatroom.rb
class Chatroom < ApplicationRecord
  attr_accessor :from_card, :from_marketplace, :from_card_marketplace

  belongs_to :user
  belongs_to :professional, optional: true
  has_many :messages

  after_create :first_message_after_creating

  def first_message_after_creating
    return if initial_message_created?

    GetProfessionalAnswerFromOpenai.new(self).call

    # Set a flag in the database to indicate that the message is created
    update_column(:initial_message_created, true)
  end 

  def topic
    self.name.split("-").reject { |item| item.match?(/\d/) }.join(" ")
  end
end
