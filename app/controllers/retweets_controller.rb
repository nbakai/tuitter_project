class RetweetsController < ApplicationController
    before_action :find_tweet
    before_action :find_retweet, only: [:destroy]
    def create
        @tweet.retweets.create(user_id: current_user.id)
        @retweet = Tweet.find(params[:id])
         
    end
    def destroy
       @retweet.destroy
        
        redirect_to tweet_path(@tweet)
    end
    def find_retweet
        @retweet = @tweet.retweets.find(params[:id])
    end

    private
    def find_tweet
        @tweet = Tweet.find(params[:tweet_id])
    end
    
end
