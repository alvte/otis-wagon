class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @user = User.find(params[:user_id])

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
    if @chatroom.save
      redirect_to user_chatroom_path(current_user, @chatroom), notice: "Chatroom created successfully."
    else
      render :new
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :user_id, :professional_id)
  end

  def last_professional_id
    # Fetch the last professional_id from the database
    Professional.last.id
  end
end
