class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :professional, optional: true
  has_many :messages

  after_create :build_default_message

  def build_default_message
    # Message.create(chatroom: self, user: self.user, content: )
  end

  # def default_message
  #   client = OpenAI::Client.new
  #   chaptgpt_response = client.chat(parameters: {
  #     model: "gpt-3.5-turbo",
  #     messages: [{ role: "user", content: "I need in 100 character a short poem about #{@card.title}}"}]
  #   })
  # end
end
