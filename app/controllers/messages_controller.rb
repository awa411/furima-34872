class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      @user = @message.user
      @time = @message.created_at.strftime("%Y年%m月%d日 %H:%M:%S")
      ActionCable.server.broadcast 'message_channel', content: @message, user: @user, time: @time
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
