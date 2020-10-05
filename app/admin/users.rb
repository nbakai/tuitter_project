ActiveAdmin.register User do
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  
  # Ex:- scope :active, -> {where(:active => true)}
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :picture, :like, :retweet, :_destroy

  #
  # or
  #
  # permit_params 
    permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :picture, :like, :retweet, :_destroy
    # tweets_attributes: [:title, :content, :user, :user_id, :like, :retweet, :tweet_id, :_destroy],
    # likes_attributes: [:tweet_id, :user_id, :_destroy]
    # # permitted << :other if params[:action] == 'create' && current_user.admin?
    # # permitted
    # form do |f|
      
     
    #   f.inputs do
    #     f.has_many :tweets, allow_destroy: true
    #   end
      
    #   f.inputs do
    #     f.has_many :likes, allow_destroy: true

    #   end
    #   f.actions
    # end
    index do
      selectable_column
      column "Nombre", :name do |user|
      link_to user.name, admin_user_path(user)
    end
    column "Tweets", :tweets_del_user do |user|
      link_to user.tweets.count, admin_user_tweets_path(user)
    end
    column "Likes", :likes_del_user do |user|
      user.likes.count
    end
    actions
    
  end
  member_action :likes do
    @likes =User.find(params[:id]).likes
  end
end
