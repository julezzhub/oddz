class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :giver_id
      t.integer :receiver_id

      t.timestamps
    end

  add_index :friendships, :giver_id
  add_index :friendships, :receiver_id
  add_index :friendships, [:giver_id, :receiver_id], unique: true
  end
end
