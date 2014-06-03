class ConversationsController < ApplicationController
  def new
    @topic_id = params[:topic_id]
  end

  def create
    @topic_id = params[:conversation][:topic_id]
    @topic = Topic.find(@topic_id)
    @conversation = @topic.conversations.create(conversation_params)
    redirect_to @topic
  end

  def show
    @conversation = Conversation.find(params[:id])
    @replies = @conversation.replies.order('created_at DESC')

  end

  private
    def conversation_params
      params.require(:conversation).permit(:title, :content)
    end

end
