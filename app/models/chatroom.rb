class Chatroom < ApplicationRecord
  attr_accessor :from_card

  belongs_to :user
  belongs_to :professional, optional: true
  has_many :messages

  after_create :first_message_after_creating


  def first_message_after_creating
    message = from_card ? messages_from_card : default_message
    Message.create(
      chatroom: self,
      user: User.find_by(email: "gpt@gmail.com"),
      content: message.dig("choices", 0, "message", "content")
    )
  end

  def default_message
    client = OpenAI::Client.new
    response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "You're a health professional but don't mention it. Say only hello to #{user.nickname}" }]
    })
  end

  def answer_gpt
    first_message_after_creating
  end

  def topic
    self.name.split("-").reject { |item| item.match?(/\d/) }.join(" ")
  end

  def messages_from_card
    client = OpenAI::Client.new
    response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "You're a health professional. Here are the last messages of the conversation #{topic}, respond in 100 words maximum accordingly"}]
    })
  end

end
