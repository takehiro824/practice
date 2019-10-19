class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to "tweet_path"}
        format.json
      end

    else
      render("tweets/show")
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text, :image).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

end
