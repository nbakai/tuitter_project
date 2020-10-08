class Tweet < ApplicationRecord
    belongs_to :user
    belongs_to :source_tweet, optional: true, inverse_of: :tweets, class_name: 'Tweet', foreign_key: 'tweet_id'
    has_many :tweets, inverse_of: :source_tweet, class_name: 'Tweet', foreign_key: 'tweet_id', dependent: :destroy
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



    def content
        if source_tweet
          source_tweet.content
        else
          super
        end
    end
      
    def content=(content)
        if source_tweet
          raise 'retweets cannot have content'
        else
          super
        end
    end
      
     
    validates :content, absence: true, if: :source_tweet
end
