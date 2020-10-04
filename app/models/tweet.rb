class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    
    #para ordenar la paginación
    default_scope {order("created_at DESC")}
    validates :content, length: {minimum: 2, message: 'Debes colocarle contenido al tweet mín 2 caracteres!'}
    validates :content, length: {maximum: 140, message: 'El máximo es de 140 caracteres!'}
    validates :content, presence: true, allow_blank: false 
    
    #scope para ver mis propios tweets
    scope :my_tweets, -> (current_user) {where(user_id: current_user)}
    
   

    def self.search(search)
        where("content LIKE ?", "%#{search}%")
    end
end
