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
    permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :picture, :like, :retweet 
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
    
  
end
