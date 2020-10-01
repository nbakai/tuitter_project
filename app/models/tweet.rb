class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :retweets, dependent: :destroy
    default_scope {order("created_at DESC")}
    validates :content, length: {minimum: 2, message: 'Debes colocarle contenido al tweet mín 2 caracteres!'}
    validates :content, length: {maximum: 140, message: 'El máximo es de 140 caracteres!'}
    validates :content, presence: true, allow_blank: false 
end
