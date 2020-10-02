class AddRetweetToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :retweet, :boolean
  end
end
