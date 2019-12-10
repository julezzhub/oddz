class ChangeDefaultValueForSeen < ActiveRecord::Migration[5.2]
  def change
    change_column_default :notifications, :seen, false
  end
end
