class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :title
      t.text :content
      t.string :user

      t.timestamps
    end
  end
end
