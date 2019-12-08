class AddColumnToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :bet_expiration, :integer
  end
end
