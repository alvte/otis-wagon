class MessagesController < ApplicationController

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    response = nil

    post_message
    if @chatroom.on_off_gpt
      if @chatroom.from_marketplace || @chatroom.from_card_marketplace
        response = chatGPT_answer_marketplace(@chatroom)
        if response&.dig(:array_content).present?
          ChatroomChannel.broadcast_to(
            @chatroom,
            render_to_string(partial: "messages/marketplace_message_main", locals: { response: response })
          )
        else
          post_message
        end
      else
        chatGPT_answer(@chatroom)
      end
    end
  end

  private

  def post_message
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      render "chatrooms/show"
    end
  end


  def message_params
    params.require(:message).permit(:content)
  end

  def chatGPT_answer(chatroom)
    @message = Message.new(
      chatroom: chatroom,
      user: User.find_by(email: "gpt@gmail.com"),
      content: chatGPT_answer_content.dig("choices", 0, "message", "content")
    )
    post_message
  end

  def chatGPT_answer_content
    words = rand(75..100)
    client = OpenAI::Client.new
    content = @chatroom.messages.last(10).map(&:content)
    response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "You're a health professional. Here are the last messages of the conversation #{content}. Respond in #{words} words maximum accordingly"}]
    })
  end

  def chatGPT_answer_marketplace(chatroom)
    response = chatGPT_answer_content_marketplace

    @message = Message.new(
      chatroom: chatroom,
      user: User.find_by(email: "gpt@gmail.com"),
      content: response[:text_before_array]
    )
    post_message

    {
      text_before_array: response[:text_before_array],
      array_content: response[:array_content]
    }
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

  def chatGPT_answer_content_marketplace
    catalog = list_product()
    words = rand(50..100)
    client = OpenAI::Client.new
    content = @chatroom.messages.last(10).map(&:content)
    response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "You're a professional vendor of sex items for health purposes propose three items to sell to the user. The iteams must come from this catalog :#{catalog}. You will adapt your answer and your answer of the product fromthe last messages of the conversation, that can find here : #{content}. Each time you will respond according to this content. You will explain why the 3 items you suggested are meaningful to the request the user just asked. Everytime you answer, you will take care of changing at least 2 products to not suggest the sames in your responses. You will prompt a second paragraph scrictly with an array containing the product ids of the items you suggested, do not announce the array, just print the [] with the numbers inside. Respond in #{words} words maximum accordingly"}]
    })
    response_content = response.dig("choices", 0, "message", "content")
    array_start_index = response_content.index("[")
    array_start_index ||= response_content.length

    text_before_array = response_content[0...array_start_index].strip
    array_content = response_content[array_start_index..-1] if array_start_index < response_content.length

    { text_before_array: text_before_array, array_content: array_content }
  end
end
