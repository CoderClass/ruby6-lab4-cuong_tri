class MessagesController < ApplicationController

  def index
    @room = Room.find_by_id(params[:room_id])
    @messages = @room.messages

    respond_to do |format|
      format.json {render json: { messages: @messages } }
      format.js
      format.html
    end
  end

  def create
    @room = Room.find_by_id(params[:room_id])
    @message = @room.messages.build message_params

    if @message.save 
      redirect_to room_messages_path
    else
      flash[:notice] = "Error #{@message.error.full_message.to_sentence}"
      redirect_to room_messages_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
