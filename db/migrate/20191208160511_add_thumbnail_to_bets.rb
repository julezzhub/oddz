class AddThumbnailToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :thumbnail, :string
  end
end
