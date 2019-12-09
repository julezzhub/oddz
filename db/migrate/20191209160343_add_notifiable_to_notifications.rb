class AddNotifiableToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :notifiable_id, :integer
  end
end
