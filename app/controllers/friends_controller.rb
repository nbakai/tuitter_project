class FriendsController < ApplicationController
    # before_action :find_tweet, only: [:index]
    def index
        @tweets = Tweet.tweets_for_me(current_user)
        @tweets = Tweet.tweets_for_me(current_user).page(params[:page])
    end
  
    def create
        @friend = Friend.new(friend_params)
        
       
        if @friend.save
            flash[:notice] = "Added friend."
            redirect_to root_path
        else
            flash[:error] = "Unable to add friend."
            redirect_to root_path
        end
    end
       
    def destroy
        @friend = current_user.friend.find(params[:id])
        @friend.destroy
        flash[:notice] = "Removed friend."
        redirect_to root_path
    end
    private
    # def find_tweet
    #     @tweet = Tweet.find(params[:user_id])
    # end

    def friend_params
        params.permit(:friend_id, :user_id)
    end
end
