class ChangeDefaultValueForPremade < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bets, :premade, false
  end
end
