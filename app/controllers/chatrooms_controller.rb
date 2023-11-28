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
end
