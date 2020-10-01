class AddLikeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :like, :boolean
  end
end
