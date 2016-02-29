class MessagesController < ApplicationController
  def index
    set_conversation
     if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      @messages.last.read = true if @messages.last.user_id != current_user.id
    end
    @message = @conversation.messages.new
   end

  def new
    @message = @conversation.messages.new
  end

  def create
    set_conversation
    @message = @conversation.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html {redirect_to conversation_messages_path(@conversation)}
        format.js {}
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
