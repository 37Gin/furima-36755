class MessagesController < ApplicationController
before_action :authenticate_user!

  def create
    message = Message.create(message_params)
    if message.save
      ActionCable.server.broadcast 'message_channel', content: message, nickname: message.user.nickname
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
