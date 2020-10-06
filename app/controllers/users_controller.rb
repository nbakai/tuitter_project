class UsersController < ApplicationController
  def index
    @user  = User.find(params[:id])
    @user  = User.page(params[:page])
    
  end
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page])
     
  end
  
  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page])
  end

  def show 
    @user  = User.find(params[:id])
      
  end
end