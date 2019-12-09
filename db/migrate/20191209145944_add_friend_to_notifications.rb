class AddFriendToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :friend_id, :integer
  end
end
