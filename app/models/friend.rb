class Friend < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :friend, class_name: "User"

  validates :user_id, presence: true
  validates :friend_id, presence: true
  scope :tweets_for_me, -> (current_user) {where(user_id: current_user, friend_id: current_user.friends)}
end
