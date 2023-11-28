class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  belongs_to :professional
end
