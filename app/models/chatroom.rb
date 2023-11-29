class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :professional, optional: true
  has_many :messages

  after_create :build_default_message

  def build_default_message
    Message.create(
        chatroom: self,
        user: Professional.find_by(email: "gpt@gmail.com"),
        professional: User.find_by(email: "pro@sex.com"),
        content: default_message
      )
  end

  def default_message
    client = OpenAI::Client.new
    response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "I need in 100 character a short poem about #{topic}}"}]
    })
  end

  def topic
    self.name.split("-").reject { |item| item.match?(/\d/) }.join(" ")
  end
end
