class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: {message: @message}),
      )
      head :ok
    else
    end
    first_message_after_creating(@chatroom)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def first_message_after_creating(chatroom)
    while chatgpton = true
    @message = Message.new(
      chatroom: chatroom,
      user: User.find_by(email: "gpt@gmail.com"),
      content: default_message.dig("choices", 0, "message", "content")
    )
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: {message: @message}),
      )
      head :ok
    else
    end
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
end
