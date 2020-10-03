class FriendsController < ApplicationController
    # def index
    #     @tweets = Tweet.tweets_for_me(current_user)
    #     @tweets = Tweet.tweets_for_me(current_user).page(params[:page])
    # end

    def create
        @friend = current_user.friends.build(friend_id: params[:friend_id])
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
       
    def friend_params
        params.require(:friend).permit(:friend_id, :user_id)
    end
end
