class LikesController < ApplicationController
  before_action :set_variables

  def create
    like = current_user.likes.new(tweet_id: @tweet.id)
    like.save
  end

  def destroy
    like = current_user.likes.find_by(tweet_id: @tweet.id)
    like.destroy
  end

  private

  def set_variables
    @tweet = Tweet.find(params[:tweet_id])
    @id_name = "#like-link-#{@tweet.id}"
    @id_heart = "#heart-#{@tweet.id}"
  end
end