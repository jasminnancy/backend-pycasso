class CreateCloseFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :close_friends do |t|
      t.integer :close_friend_id
      t.integer :user_id
      
      t.timestamps
    end
  end
end
