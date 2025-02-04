ActiveAdmin.register Tweet do
  belongs_to :user
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :content, :user, :user_id, :like, :retweet, :tweet_id, :_destroy
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :content, :user, :user_id, :like, :retweet, :tweet_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
