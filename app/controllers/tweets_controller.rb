class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :index

  # GET /tweets
  # GET /tweets.json
  def index
    if params[:search]
      @tweets = Tweet.search(params[:search]).page(params[:page]).order("created_at DESC")
      
    else
      
      @tweets = Tweet.where("user_id IN (?)", current_user.friend_ids).page(params[:page])
      @tweets = Tweet.my_tweets(current_user).page(params[:page])
    end
  end

  
  # GET /tweets/1
  # GET /tweets/1.json
  def show
    if !@friend.nil? 
      @users = User.all
      @user = User.friend.find(params[:id])
      current_user
      if @current_user
        @friend = Friend.where(user_id: @user.id, friend_id: @current_user.id).first
      end
    end

  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
   
  end

  # GET /tweets/1/edit
  def edit
    if @tweet.user_id != current_user.id 
      redirect_to root_path, alert: 'No puedes editar este tweet!'
    end
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update

    @tweet = Tweet.find(params[:id])
        @tweet.update(like: !@tweet.like ) 
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      
      @tweet = Tweet.find(params[:id])
    
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:title, :content, :user, :like)
    end
  
end
