class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, :dependent => :destroy
  has_many :likes, dependent: :destroy
  has_many :active_friends, class_name:  "Friend", foreign_key: "friend_id", dependent: :destroy
  has_many :no_friends, class_name: "Friend", foreign_key: "user_id", dependent: :destroy
 
  has_many :following, through: :active_friends, source: :user
  has_many :followers, through: :no_friends, source: :friend



  validates :name, uniqueness: { case_sensitive: true }
  validates :name, presence: true




end
