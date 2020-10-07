json.array! @tweets do |tweet|
    json.id tweet.id
    json.body  tweet.content
    json.like  tweet.likes.count 
    json.retweet    tweet.retweets 
    json.user do
        json.id tweet.user.id
        json.name tweet.user.name
      end
    
end