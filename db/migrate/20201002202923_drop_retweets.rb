class DropRetweets < ActiveRecord::Migration[5.2]
  def change
    drop_table :retweets 
  end
end
