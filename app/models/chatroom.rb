class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :professional, optional: true
  has_many :messages

  after_create :first_message_after_creating

  def first_message_after_creating
    Message.create(
      chatroom: self,
      user: User.find_by(email: "gpt@gmail.com"),
      content: default_message.dig("choices", 0, "message", "content")
    )
  end

  def default_message
    # client = OpenAI::Client.new
    # response = client.chat(parameters: {
    #   model: "gpt-3.5-turbo",
    #   messages: [{ role: "user", content: "I need in 100 character a short poem about #{topic}}"}]
    # })
    client = OpenAI::Client.new
    response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "Just print hello" }]
    })
  end

  def answer_gpt
    first_message_after_creating
  end

  def topic
    self.name.split("-").reject { |item| item.match?(/\d/) }.join(" ")
  end
end
