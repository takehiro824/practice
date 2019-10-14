class TweetsController < ApplicationController
  def index 
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update
  end

  
  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.user_id == current_user.id
      @tweet.destroy
      redirect_to root_path
    end
  end

  def tweet_params
    params.require(:tweet).permit(:content, :image).merge(user_id: current_user.id)
  end
end
