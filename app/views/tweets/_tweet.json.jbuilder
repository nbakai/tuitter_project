json.extract! tweet, :id, :title, :content, :user, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
