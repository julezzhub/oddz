class AddTitleToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :video_title, :string
  end
end
