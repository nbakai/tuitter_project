class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    validates :content, length: {maximum: 140, message: 'El máximo es de 140 caracteres!'}
end
