class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friended_id

      t.timestamps
    end

  add_index :friendships, :user_id
  add_index :friendships, :friended_id
  end
end
