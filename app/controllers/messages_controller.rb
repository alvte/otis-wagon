class MessagesController < ApplicationController

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    post_message
    if @chatroom.on_off_gpt
      # while chatgpt is on return chatGPT_answer(@chatroom)
      chatGPT_answer(@chatroom)
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
    client = OpenAI::Client.new
    content = @chatroom.messages.last(10).map(&:content)
    response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "Here are the last messages of the conversation #{content}, respond in 100 words maximum accordingly"}]
    })
  end
end
