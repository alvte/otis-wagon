class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
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
    @chatroom = Chatroom.new(name: "#{params.dig(:join, :category) || "Chat number #{current_user.chatrooms.count()}"}-#{current_user.id}".parameterize)
    @chatroom.user = current_user
    @chatroom.professional_id = last_professional_id
    @chatroom.from_card = params.dig(:join, :from_card)
    @chatroom.from_marketplace = params.dig(:join, :from_marketplace)
    @chatroom.from_card_marketplace = params.dig(:join, :from_card_marketplace)

    if @chatroom.save
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
    params.require(:chatroom).permit(:name, :user_id, :professional_id, :from_card, :from_marketplace, :from_card_marketplace)
  end

  def last_professional_id
    # Fetch the last professional_id from the database
    Professional.last.id
  end
end
