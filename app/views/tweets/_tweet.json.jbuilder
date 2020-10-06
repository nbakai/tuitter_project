
json.extract! tweet, :id, :title, :content, :user, :like, :retweet
json.url tweet_url(tweet, format: :json)
json.partial! "shared/pagination", collection: tweet
