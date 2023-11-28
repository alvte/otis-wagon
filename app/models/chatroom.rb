class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :professional
  has_many :messages
end
