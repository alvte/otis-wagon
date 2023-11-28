class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @user = User.find(params[:user_id])
    @chatrooms = @user.chatrooms
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user = current_user
    raise

    if @chatroom.save
      redirect_to user_chatrooms_path(current_user), notice: "Chatroom created successfully."
    else
      render :new
    end
  end

  private
  def chatroom_params
    params.require(:chatroom).permit(:name, :user_id)
  end

end
