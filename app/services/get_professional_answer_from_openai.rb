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
    result = if @chatroom.from_card
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
      content: result[:text_before_array]
    )
    p result
    result[:array_content]
  end


  def default_message
    chat_with_gpt("You're a health professional but don't mention it. Say only hello to #{@user.nickname}")
  end

  def messages_from_card
    words = rand(50..75)
    chat_with_gpt("You're a health professional but don't mention it. Say only hello to #{@user.nickname}.
      Explain me this topic #{topic}, in #{words} words maximum accordingly")
  end

  def messages_from_marketplace
    chat_with_gpt("You're a vendor of sex products for health purposes and mention it. Say only hello to #{@user.nickname}")
  end

  def list_product
    products = Product.all
    products_json = products.map do |product|
      {
        id: product.id,
        name: product.name,
        price: product.price,
        description: product.description
      }
    end

    return ({ :products => products_json }.to_json)
  end

  def messages_from_card_from_marketplace
    catalog = list_product
    words = rand(75..100)
    chat_with_gpt("You're a vendor of sex products for health purposes and mention it. Say only hello to #{@user.nickname}.
      Sell me 3 items related to #{topic} that are in this #{catalog}. And expalin why you choose them to answer this specific #{topic}You will prompt a second paragraph scrictly with an array containing the product ids of the items you suggested. Do not talk about the array or announce that you created it, just print the [] with the numbers inside and stop there. Those ids must be contains in this array only and should not appear anywhere else in your response. It is really important that the array, the ids or any mention of it's creation must remains in this dedicated space. NEVER mention the word id anywhere. Respond in #{words} words maximum accordingly")
  end

  def chat_with_gpt(content)
    client = OpenAI::Client.new
    response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: content }]
    })

    response_content = response.dig("choices", 0, "message", "content")
    array_start_index = response_content.index("[")
    array_start_index ||= response_content.length

    text_before_array = response_content[0...array_start_index].strip
    array_content = response_content[array_start_index..-1] if array_start_index < response_content.length

    { text_before_array: text_before_array, array_content: array_content }
  end

  def topic
    @chatroom.topic
  end
end
