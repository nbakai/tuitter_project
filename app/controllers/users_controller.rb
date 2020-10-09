class UsersController < ApplicationController
  def index
    @user  = User.find(params[:id])
    @user  = User.page(params[:page])
    
  end
  def following
    @title = "Seguidores"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page])
     
  end
  
  def followers
    @title = "Seguidos"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page])
  end

  def show 
    @user  = User.find(params[:id])
      
  end
  def destroy
    @user = Friend.find(params[:id])
    current_user.unfollow(@user)
    redirect_to root_path
  end

end