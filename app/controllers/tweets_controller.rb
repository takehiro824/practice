class TweetsController < ApplicationController
  def index 
    @tweets = Tweet.all.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { redirect_to root_path, status: :created, location: @tweet }
        format.js { @status = "success"}
      else
        format.html { redirect_to root_path}
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
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

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
  end

  def tweet_params
    params.require(:tweet).permit(:content, :image).merge(user_id: current_user.id)
  end
end
