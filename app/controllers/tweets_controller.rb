class TweetsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_tweet, only: [:show, :edit, :update, :destroy, :retweet]
  before_action :authenticate_user!, except: [:index, :news, :dates]
  # include ActionController::HttpAuthentication::Basic::ControllerMethods
  # http_basic_authenticate_with name: "apituit", password: "Tuits", only: :create 

  # GET /tweets
  # GET /tweets.json
  def index
    if params[:search]
      @tweets = Tweet.search(params[:search]).page(params[:page]).order("created_at DESC")
      
    else
      #@tweets = Tweet.tweets_for_me(current_user).page(params[:page])
      #@tweets = Tweet.where("user.name IN (?)", current_user.friend.user_id).page(params[:page])
      @tweets = Tweet.my_tweets(current_user).page(params[:page])
    end
  end
  def news
    @arr= []
    @hash = {}
    @tweets = Tweet.limit(50)
    @tweets.each do |tweet|
      @arr += ["id": tweet.id, "content": tweet.content, "user_id": tweet.user_id, "likes": tweet.likes.count, "retweets": tweet.retweet]
    end
    @tweets = @arr
    render json: @tweets
  end

  def dates
    @arr= []
    @hash = {}
    
    startdate = Date.parse(params[:startdate])
    enddate = (Date.parse(params[:enddate])) + 1
    @tweets = Tweet.all.where(created_at: startdate..enddate) 
  
    @tweets.each do |tweet|
       @arr += ["id": tweet.id, "content": tweet.content, "user_id": tweet.user_id, "likes": tweet.likes.count, "retweets": tweet.retweet]
    end
    @tweets = @arr
    #@tweets = Tweet.all.find_by "created_at < ?", "2020-10-07 00:00"
    render json: @tweets
  end
  
  
  # GET /tweets/1
  # GET /tweets/1.json
  def show
    if params[:search]
      redirect_to tweets_path, alert: 'Busca dentro de la página de inicio por favor!'
      @tweets = Tweet.search(params[:search]).page(params[:page]).order("created_at DESC")
    end
    # if !@friend.nil? 
    #   @users = User.all
    #   @user = User.friend.find(params[:id])
    #   current_user
    #   if @current_user
    #     @friend = Friend.where(user_id: @user.id, friend_id: @current_user.id).first
    #   end
    # end

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
    if current_user != nil
      @tweet.user_id = current_user.id
    else 
      @tweet.user_id = params[:user_id]
    end 
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


def tweet
  original_tweet = Tweet.find_by(params[:id])
  @retweet = Tweet.new(
    user_id: current_user.id,
    tweet_id: original_tweet.id,
  )
  @retweet.save
  if @retweet.save
    redirect_to tweet_path, alert: 'Retweeted!'
  else
    redirect_to root_path, alert: 'Can not retweet'
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
      params.require(:tweet).permit(:content, :user, :like, :id, :tweet, :tweet_id)
    end
end
