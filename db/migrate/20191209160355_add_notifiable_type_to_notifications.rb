class AddNotifiableTypeToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :notifiable_type, :string
  end
end
