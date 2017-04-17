class MessagesController < ApplicationController

  def index
    # render json: params
    @user = User.find(session[:user_id])
    @messages = Message.includes(:user)
  end

  def create
    # render json: params
    @user = User.find(session[:user_id])
    @message = @user.messages.create(message_params)
    if @message
        redirect_to "/messages"
    else
        @message.errors.full_messages
        # render text: "Invalid message"
    end
    # @message = @user.messages.create(:message)
  end

  private
    def message_params
      # For all the params
      params.require(:message).permit(:message)
    end
end
