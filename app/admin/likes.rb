ActiveAdmin.register Like do
  controller do
    nested_belongs_to :user, :tweet, optional: true
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :tweet_id, :user_id, :_destroy
  #
  # or
  #
  # permit_params do
  #   permitted = [:tweet_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
