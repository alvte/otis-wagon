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
    @chatroom.professional_id = last_professional_id

    if @chatroom.save
      redirect_to user_chatrooms_path(current_user), notice: "Chatroom created successfully."
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
    Professional.order(id: :desc).pluck(:id).first
  end
end
