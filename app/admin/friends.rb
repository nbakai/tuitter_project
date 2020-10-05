ActiveAdmin.register Friend do
    belongs_to :user
    permit_params :friend_id, :user_id, :_destroy
end