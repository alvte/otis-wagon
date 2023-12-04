class GetProfessionalAnswerFromOpenai
  def initialize(chatroom)
    @chatroom = chatroom
    @user = @chatroom.user
  end

  def call
    puts "Call Openai too fetch answers..."
    create_initial_message
  end

  private

  def create_initial_message
    message_content = if @chatroom.from_card
                        messages_from_card
                      elsif @chatroom.from_marketplace
                        messages_from_marketplace
                      elsif @chatroom.from_card_marketplace
                        messages_from_card_from_marketplace
                      else
                        default_message
                      end

    Message.create(
      chatroom: @chatroom,
      user: User.find_by(email: "gpt@gmail.com"),
      content: message_content.dig("choices", 0, "message", "content")
    )
  end

  def default_message
    chat_with_gpt("You're a health professional but don't mention it. Say only hello to #{@user.nickname}")
  end

  def messages_from_card
    chat_with_gpt("You're a health professional but don't mention it. Say only hello to #{@user.nickname}.
      Explain me this topic #{topic}, in 100 words maximum accordingly")
  end

  def messages_from_marketplace
    chat_with_gpt("You're a vendor of sex products for health purposes and mention it. Say only hello to #{@user.nickname}")
  end

  def messages_from_card_from_marketplace
    words = rand(25..50)
    chat_with_gpt("You're a vendor of sex products for health purposes and mention it. Say only hello to #{@user.nickname}.
      Sell me 3 items related to #{topic}, in #{words} words maximum accordingly")
  end

  def chat_with_gpt(content)
    client = OpenAI::Client.new
    response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: content }]
    })
    response
  end

  def topic
    @chatroom.topic
  end
end
