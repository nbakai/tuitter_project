class Friend < ApplicationRecord
  belongs_to :users
  has_and_belongs_to_many :friends, dependent: :destroy
  scope :tweets_for_me, -> (current_user) {where(user_id: current_user, friend_id: current_user.friends)}
end
