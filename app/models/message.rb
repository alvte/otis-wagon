require 'json'

class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user, optional: true
  belongs_to :professional, optional: true

  def parse_content
    JSON.parse(self.content)
  end
end
