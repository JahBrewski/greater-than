class RepliesController < ApplicationController

  def new
    @conversation_id = params[:conversation_id]
  end

  def create
    @conversation_id = params[:reply][:conversation_id]
    @conversation = Conversation.find(@conversation_id)
    @reply = @conversation.replies.create(reply_params)
    redirect_to @conversation
  end

  private
    def reply_params
      params.require(:reply).permit(:content)
    end

end
