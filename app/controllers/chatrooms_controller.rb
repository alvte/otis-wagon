require 'JSON'
class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    if params[:format]
      @content = JSON.parse(params[:format])
    end
  end

  def index
    @user = User.find(params[:user_id]) || current_user[:id]

    if current_user.professional
      @chatrooms = current_user.professional.chatrooms
    else
      @chatrooms = current_user.chatrooms
    end
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(
      name: chatroom_name,
      user: current_user,
      professional_id: last_professional_id,
      from_card: params.dig(:join, :from_card),
      from_marketplace: params.dig(:join, :from_marketplace),
      from_card_marketplace: params.dig(:join, :from_card_marketplace)
      )

    if @chatroom.save
      response = GetProfessionalAnswerFromOpenai.new(@chatroom).call

      if response
        @message = Message.new(
        chatroom: @chatroom,
        user: User.find_by(email: "gpt@gmail.com"),
        content: response
        )

        if @message.save
          ChatroomChannel.broadcast_to(
            @chatroom,
            render_to_string(partial: "messages/marketplace_message", locals: { message: @message })
          )
        else
          render "chatrooms/show"
        end
      end
      redirect_to user_chatroom_path(current_user, @chatroom), notice: "Chatroom created successfully."
    else
      render :new
    end
  end

  def deactivate_chat_GPT
    @chatroom = Chatroom.find(params[:id])
    @chatroom.on_off_gpt = false
    @chatroom.save
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(
      :name,
      :user_id,
      :professional_id,
      :from_card,
      :from_marketplace,
      :from_card_marketplace
      )
  end

  def last_professional_id
    Professional.last.id
  end

  def chatroom_name
    "#{params.dig(:join, :category) || "Chat number #{current_user.chatrooms.count()}"}-#{current_user.id}".parameterize
  end
end
